# Colour & Shape Learning App

A simple Docker-based web application to teach toddlers colours and shapes.

## Features

- Random colour and shape combinations (e.g., "red square", "green triangle")
- Large visual display of coloured shapes
- Interactive correct/incorrect feedback with sounds and images
- Customizable backgrounds, feedback images, and sounds
- Optional AI voice support using Kokoro TTS

## Colours Included

red, blue, green, yellow, orange, purple, pink, brown, black, white

## Shapes Included

circle, square, triangle, rectangle, star, heart, diamond, oval

## Folder Structure

```
images/
  ├── backgrounds/     # Background images for the main screen
  ├── correct/         # Images shown when "Correct" is clicked
  └── incorrect/       # Images shown when "Incorrect" is clicked

sounds/
  ├── correct/         # Sounds played when "Correct" is clicked
  └── incorrect/       # Sounds played when "Incorrect" is clicked

ai_voice/              # Optional: Kokoro TTS model files for AI voice (git-ignored)
```

## Setup Instructions

### 1. Add Your Media Files

Add your custom images and sounds to the appropriate folders:

- **Backgrounds**: Add images to `images/backgrounds/` (named bg1.jpg, bg2.jpg, etc.)
- **Correct feedback**: Add images to `images/correct/` (any .jpg files)
- **Incorrect feedback**: Add images to `images/incorrect/` (any .jpg files)
- **Correct sound**: Add sounds to `sounds/correct/` (any .mp3 files)
- **Incorrect sound**: Add sounds to `sounds/incorrect/` (any .mp3 files)

### 2. Build and Run

```bash
docker-compose up --build
```

### 3. Access the App

Open your browser and navigate to:
```
http://localhost:5000
```

## Usage

1. Optionally enter the child's name
2. Click "Start" to begin
3. A coloured shape will appear with its label (e.g., "red square")
4. Click "✓ Correct" if the child identifies it correctly
5. Click "✗ Incorrect" if they need to try again
6. The app will play the appropriate sound and show feedback
7. A new colour/shape combination appears automatically after 2 seconds

## Stopping the App

```bash
docker-compose down
```

## Quick Start (No Media Files)

The app will work even without custom media files - it will use a gradient background and skip sounds if files are missing.

## Optional: AI Voice (Kokoro TTS)

To enable AI voice that speaks feedback messages:

1. Download the Kokoro model: `git clone https://huggingface.co/hexgrad/Kokoro-82M ai_voice`
2. Rebuild the container: `docker-compose up --build`

If the `ai_voice/` folder is empty, the app runs normally without voice. The voice will speak the scrolling text (e.g., "Well done [name]!" or "Incorrect, it was a red square").
