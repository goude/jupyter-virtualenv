#!/bin/bash
source venv/bin/activate
cd data
jupyter notebook --ip='*' --no-browser
