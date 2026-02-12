import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';

import '../services/backup/backup_service.dart';
import '../utils/constants.dart';
import '../providers/exercise_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _backupService = BackupService();
  bool _isExporting = false;
  bool _isImporting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設置'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('數據備份'),
          
          ListTile(
            leading: const Icon(Icons.backup, color: AppColors.primary),
            title: const Text('導出數據'),
            subtitle: const Text('將所有數據備份到文件'),
            trailing: _isExporting
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.chevron_right),
            onTap: _isExporting ? null : _handleExport,
          ),
          
          ListTile(
            leading: const Icon(Icons.restore, color: AppColors.secondary),
            title: const Text('導入數據'),
            subtitle: const Text('從備份文件恢復數據'),
            trailing: _isImporting
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.chevron_right),
            onTap: _isImporting ? null : _handleImport,
          ),
          
          const Divider(),
          
          _buildSectionHeader('隱私與安全'),
          
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: AppColors.success),
            title: const Text('數據隱私'),
            subtitle: const Text('您的數據僅存儲在本地設備'),
            onTap: () => _showPrivacyDialog(context),
          ),
          
          const ListTile(
            leading: Icon(Icons.storage, color: AppColors.textSecondary),
            title: Text('存儲位置'),
            subtitle: Text('設備本地 SQLite 數據庫'),
          ),
          
          const Divider(),
          
          _buildSectionHeader('關於'),
          
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('版本信息'),
            subtitle: Text(AppConstants.appVersion),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Future<void> _handleExport() async {
    setState(() => _isExporting = true);
    
    try {
      final backupPath = await _backupService.createBackup(compress: true);
      await _backupService.shareBackup(backupPath);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('備份創建成功！'),
            backgroundColor: AppColors.success,
          ),
        );
      }
      
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('備份失敗: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isExporting = false);
      }
    }
  }

  Future<void> _handleImport() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json', 'zip'],
    );
    
    if (result == null || result.files.isEmpty) {
      return;
    }
    
    final filePath = result.files.single.path;
    if (filePath == null) {
      return;
    }
    
    final strategy = await _showImportStrategyDialog();
    if (strategy == null) {
      return;
    }
    
    setState(() => _isImporting = true);
    
    try {
      await _backupService.importBackup(filePath, strategy: strategy);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('數據導入成功！'),
            backgroundColor: AppColors.success,
          ),
        );
        
        ref.invalidate(exercisesProvider);
      }
      
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('導入失敗: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isImporting = false);
      }
    }
  }

  Future<ImportStrategy?> _showImportStrategyDialog() async {
    return showDialog<ImportStrategy>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('導入策略'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('如何處理已存在的數據？'),
            const SizedBox(height: 16),
            
            ListTile(
              title: const Text('覆蓋'),
              subtitle: const Text('刪除現有數據，使用備份替換'),
              onTap: () => Navigator.pop(context, ImportStrategy.overwrite),
            ),
            
            ListTile(
              title: const Text('合併'),
              subtitle: const Text('保留現有數據，合併新數據'),
              onTap: () => Navigator.pop(context, ImportStrategy.merge),
            ),
            
            ListTile(
              title: const Text('跳過重複'),
              subtitle: const Text('僅導入不存在的記錄'),
              onTap: () => Navigator.pop(context, ImportStrategy.skip),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('數據隱私聲明'),
        content: const SingleChildScrollView(
          child: Text(
            '✅ 您的數據完全存儲在設備本地\n\n'
            '✅ 開發者無法訪問您的任何數據\n\n'
            '✅ 無網路請求，無數據上傳\n\n'
            '✅ 備份文件由您自主控制\n\n'
            '✅ 刪除應用將永久刪除數據\n\n'
            '建議：定期備份數據以防設備丟失',
            style: TextStyle(fontSize: 14),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('了解'),
          ),
        ],
      ),
    );
  }
}