#!/bin/bash
echo "Running App Test (Node.js)"
ab -n 1000 -c 10 http://localhost:3000/
