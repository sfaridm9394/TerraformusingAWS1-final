#!/bin/bash
cd "$(dirname "$0")"
zip lambda.zip lambdafunction.py
echo "lambda.zip created!"