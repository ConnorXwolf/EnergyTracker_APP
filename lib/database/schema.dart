/// 數據庫表結構定義
class DatabaseSchema {
  /// 建表語句
  static const List<String> createTableStatements = [
    createExercisesTable,
    createExerciseLogsTable,
    createTasksTable,
    createEventsTable,
    createDailyPointsTable,
  ];
  
  /// 創建運動定義表
  static const String createExercisesTable = '''
    CREATE TABLE exercises (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      category TEXT NOT NULL CHECK(category IN ('cardio', 'muscle', 'stretch')),
      color TEXT NOT NULL,
      target_value INTEGER NOT NULL CHECK(target_value > 0),
      unit TEXT NOT NULL CHECK(unit IN ('reps', 'sets', 'minutes', 'km', 'hours')),
      created_at TEXT DEFAULT CURRENT_TIMESTAMP,
      UNIQUE(name)
    )
  ''';
  
  /// 創建運動日誌表
  static const String createExerciseLogsTable = '''
    CREATE TABLE exercise_logs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      exercise_id INTEGER NOT NULL,
      date TEXT NOT NULL CHECK(date LIKE '____-__-__'),
      completed INTEGER NOT NULL DEFAULT 0,
      actual_value INTEGER NOT NULL DEFAULT 0 CHECK(actual_value >= 0),
      notes TEXT DEFAULT '',
      logged_at TEXT DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE,
      UNIQUE(exercise_id, date)
    )
  ''';
  
  /// 創建任務表
  static const String createTasksTable = '''
    CREATE TABLE tasks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      is_completed INTEGER NOT NULL DEFAULT 0,
      date TEXT NOT NULL DEFAULT (date('now')) CHECK(date LIKE '____-__-__'),
      due_date TEXT CHECK(due_date IS NULL OR due_date LIKE '____-__-__'),
      priority INTEGER NOT NULL DEFAULT 0 CHECK(priority BETWEEN 0 AND 2),
      category TEXT,
      created_at TEXT DEFAULT CURRENT_TIMESTAMP,
      completed_at TEXT
    )
  ''';
  
  /// 創建事件表
  static const String createEventsTable = '''
    CREATE TABLE events (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      event_date TEXT NOT NULL CHECK(event_date LIKE '____-__-__'),
      description TEXT,
      created_at TEXT DEFAULT CURRENT_TIMESTAMP
    )
  ''';
  
  /// 創建每日點數表
  static const String createDailyPointsTable = '''
    CREATE TABLE daily_points (
      date TEXT PRIMARY KEY CHECK(date LIKE '____-__-__'),
      physical INTEGER NOT NULL DEFAULT 0 CHECK(physical BETWEEN 0 AND 10),
      mental INTEGER NOT NULL DEFAULT 0 CHECK(mental BETWEEN 0 AND 10),
      hp INTEGER NOT NULL DEFAULT 20 CHECK(hp BETWEEN 20 AND 100),
      created_at TEXT DEFAULT CURRENT_TIMESTAMP,
      updated_at TEXT DEFAULT CURRENT_TIMESTAMP
    )
  ''';
  
  /// 創建索引
  static const List<String> createIndexStatements = [
    'CREATE INDEX idx_exercise_logs_date ON exercise_logs(date)',
    'CREATE INDEX idx_exercise_logs_exercise_id ON exercise_logs(exercise_id)',
    'CREATE INDEX idx_tasks_date ON tasks(date)',
    'CREATE INDEX idx_tasks_due_date ON tasks(due_date)',
    'CREATE INDEX idx_tasks_category ON tasks(category)',
    'CREATE INDEX idx_events_date ON events(event_date)',
  ];
}