#!/usr/bin/env bash
set -e

echo "Restarting ollama..."
sudo systemctl restart ollama
sudo systemctl status ollama --no-pager
