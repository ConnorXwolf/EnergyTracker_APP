# 🔋 Energy Tracker (Flutter Version)

Personal Energy and Productivity Tracker for chronic illness management.

## 🌟 The Story Behind the Project

**EnergyTracker** was born out of a personal battle.

As a developer living with **Fibromyalgia** and other chronic illnesses, I realized that traditional "productivity" apps are often discouraging. They focus on how much you can *do*, rather than how much you can *sustain*. In the chronic illness community, we often refer to "Spoon Theory"—the idea that we have a limited amount of energy (spoons) each day.

I built this app to help myself—and others with similar special needs—visualize their daily "HP" (Health Points). It is a tool designed to help you practice **Pacing**, avoid "crash and burn" cycles, and communicate your energy patterns with health professionals.

---

## 📱 About

This is a **Flutter mobile application** converted from the original PyQt6 desktop version. It helps users with chronic illnesses track their daily energy levels, exercises, and tasks through a gaming-inspired HP (Health Points) system.

## ✨ Features

- **HP Tracking System**: Daily Physical/Mental energy recording (0-10 points each)
- **Exercise Management**: Track Cardio, Muscle, and Stretch exercises
- **Task Checklist**: Manage tasks with priorities, categories, and due dates
- **Calendar Events**: Event management and visualization
- **Data Visualization**: Ring charts for HP display
- **Offline First**: 100% local storage using SQLite

---

## 🎮 The HP System: Your Daily Stats

The app uses three core metrics to determine your daily capacity. While the main screen shows a simplified ring, you can click **"More"** to see the full breakdown:

| Color | Element | Game Analogy | Meaning |
| --- | --- | --- | --- |
| 🟡 **Yellow** | **Stamina** | Physical Energy | Your body's physical capacity (movement, chores). |
| 🔵 **Blue** | **Mana** | Mental Energy | Your mood, cognitive load, and "brain" levels. |


### 📈 The Calculation

Your functional energy is calculated using this formula:

$$HP = (\text{Physical} + \text{Mental})

---

## 📖 User Guide

### 1. Calendar and Events

The Calendar is your command center for the month.

* **Navigate**: Click any date to view what you achieved or planned for that specific day.
* **Highlights**: Dates with recorded tasks or health events are highlighted so you can quickly see your "busy" days.
* **Unified List**: Below the calendar, you will see a combined list of both your appointments (Events) and your To-Dos (Tasks) for a clear view of your day's "cost."

### 2. Daily Exercise 

* **Track Progress**: Use the Exercise Manager to log cardio exercise, stretching, or muscle building.
* **Visual Feedback**: Progress bars show how close you are to your daily goal.


### 3. Tasks (Energy Consumption)

Manage your daily chores and work with **Priority Levels**.

* **Add Tasks**: Group tasks by category (e.g., Work, Home, Medical).
* **Prioritize**: Assign "Low," "Medium," or "High" priority. 


### 4. Monthly HP Tracker (The "More" Button)

Click the **"More"** button to enter the deep-dive analysis.

* **31-Day Ring**: View your entire month as a circular visualization.
* **Color-Coded Health**: Each day's segment is colored based on your total HP. 🔴 indicate "Crash Days," while 🟢show when you successfully stayed within your limits.
* **Trend Analysis**: Hover over segments to see exactly why a day was difficult (e.g., was it high Fatigue or low Mana?).

### 5. Accessibility & UI Settings

Chronic illness often comes with visual fatigue or "brain fog." You can customize the app to be easier on your eyes:

* **UI Scaling**: Go to **Settings** to increase the overall scale of the interface (e.g., 1.2x or 1.5x) to make buttons easier to hit.
* **Text Size**: Independently adjust the font size to ensure all instructions and labels are clear and readable without strain.

---

## 🔒 Privacy & Safety

* **100% Offline**: Your health data is yours alone. It is stored in a file named `energy_tracker.db` on your computer. Nothing is ever uploaded to the internet.
* **No Medical Advice**: This app is a tracking tool, not a doctor. Always listen to your body over the app’s numbers.

---

## 📝 License

This project is created for personal use and chronic illness management.

## 💬 Note from Developer

This app is developed with care for the chronic illness community. Features are added as energy allows. If you have suggestions for improving accessibility, please feel free to contribute.

**Gentle reminder: You are more than your productivity.**

---

*Converted from Python/PyQt6 to Flutter for mobile accessibility.*
