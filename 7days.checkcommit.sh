#!/bin/sh
git log --pretty='%H %cr' --since=7.days|wc -l
