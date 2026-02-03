#!/bin/bash
# Array of high-quality 7B-12B models that fit in 16GB RAM
# Sizes range from ~4.7GB to ~8.5GB for Q4 quantizations
models=(
    "llama3.1:8b"           # Meta's standard 8B model
    "gemma2:9b"             # Google's high-performance 9B model
    "mistral:7b"            # The classic, highly balanced 7B model
    "deepseek-r1:8b"        # Distilled reasoning model for complex tasks
    "qwen2.5:7b"            # Exceptional for technical and multilingual tasks
    "phi4:14b"              # Latest Microsoft model; slightly heavier but smart
    "mistral-nemo:12b"      # Collaborative model by Mistral & NVIDIA; high context
    "wizardlm2:7b"          # Known for high speed and reasoning capabilities
    "solar:10.7b"           # Effective mid-sized generalist model
    "codestral:22b"         # Optional: Only pull if you want to test 22B boundaries
)
echo "Starting model downloads for 16GB RAM setup..."
for model in "${models[@]}"; do
    echo "-------------------------------------------"
    echo "Attempting to pull: $model"
    # The '|| true' ensures the script continues if a pull fails
    ollama pull "$model" || echo "Failed to pull $model, skipping..."
done
echo "-------------------------------------------"
echo "Download process complete. Use 'ollama list' to verify."
