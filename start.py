#!/usr/bin/env python3
import sys
import os

# Add the current directory to Python path to ensure modules can be imported
current_dir = os.path.dirname(os.path.abspath(__file__))
if current_dir not in sys.path:
    sys.path.insert(0, current_dir)

# Also add parent directory if needed
parent_dir = os.path.dirname(current_dir)
if parent_dir not in sys.path:
    sys.path.insert(0, parent_dir)

try:
    from main import app
    print("Successfully imported app from main.py")
except ImportError as e:
    print(f"Failed to import app from main.py: {e}")
    print(f"Current sys.path: {sys.path}")
    print(f"Current directory contents: {os.listdir(current_dir)}")
    raise

if __name__ == "__main__":
    uvicorn.run(
        app,  # Use the imported app directly
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )