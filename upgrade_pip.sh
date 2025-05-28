#! /bin/bash
# Running `apt update && apt upgrade` typically upgrades packages to the latest versions **available in your distribution's repositories**, but **not necessarily to the latest versions available upstream** (e.g., Python 3.12 or the latest pip). Here's how to upgrade from Python 2.7 and pip 20.3 to modern versions (like Python 3.12 and pip 24.x):
# Step-by-Step: Upgrade Python and pip

echo "Starting script... "


# Step 1: Check existing versions
echo "Showing python and pip versions: "
python --version
python3 --version
pip --version
pip3 --version


# Step 2: Install dependencies
echo "Install dependencies... "
sudo apt update -y
sudo apt install -y software-properties-common curl build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git


# Step 3: Install Python using `pyenv` (recommended for latest versions)
echo "Installing Python via pyenv... "
curl https://pyenv.run | bash

# Add pyenv to your shell (e.g., \~/.bashrc or \~/.zshrc):
echo "Adding pyenv to the shell... "
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Restart your shell or run:
echo "Restarting the shell... "
exec "$SHELL"

# Install the latest Python version:
echo "Installing the latest Python version"
pyenv install 3.12.3  # Or latest available
pyenv global 3.12.3

# Check it's now using the right version:
echo "Showing current Python version... "
python --version
which python

# Upgrade pip, Now that you're using Python 3.12:
echo "Upgrading PIP... "
python -m ensurepip --upgrade
python -m pip install --upgrade pip



### Alternative: System-Wide Installation (if you prefer not to use pyenv)
#  Download source:
#wget https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tgz
#tar -xvzf Python-3.12.3.tgz
#cd Python-3.12.3

#  Build and install:
#./configure --enable-optimizations
#make -j$(nproc)
#sudo make altinstall  # Use altinstall to avoid overwriting system python

#  Verify:
#python3.12 --version

### Notes:
# Don’t uninstall Python 2.7 if it’s the system default (many OS tools rely on it).
# Always use `python3` and `pip3` going forward.
# If you use virtual environments (`venv` or `virtualenv`), you can isolate new Python versions easily.
