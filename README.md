# Python_easy_upgrade
Python and PIP upgrade script


---

Running `apt update && apt upgrade` typically upgrades packages to the latest versions **available in your distribution's repositories**, but **not necessarily to the latest versions available upstream** (e.g., Python 3.12 or the latest pip). Here's how to upgrade from Python 2.7 and pip 20.3 to modern versions (like Python 3.12 and pip 24.x):

---

### 🔁 Step-by-Step: Upgrade Python and pip

#### 🐍 Step 1: Check existing versions

```bash
python --version
python3 --version
pip --version
pip3 --version
```

#### 🧼 Step 2: Install dependencies

```bash
sudo apt update
sudo apt install -y software-properties-common curl build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
```

#### ✅ Step 3: Install Python using `pyenv` (recommended for latest versions)

1. **Install pyenv**:

   ```bash
   curl https://pyenv.run | bash
   ```

2. **Add pyenv to your shell (e.g., \~/.bashrc or \~/.zshrc)**:

   ```bash
   export PATH="$HOME/.pyenv/bin:$PATH"
   eval "$(pyenv init --path)"
   eval "$(pyenv init -)"
   eval "$(pyenv virtualenv-init -)"
   ```

3. **Restart your shell or run**:

   ```bash
   exec "$SHELL"
   ```

4. **Install the latest Python version**:

   ```bash
   pyenv install 3.12.3  # Or latest available
   pyenv global 3.12.3
   ```

5. **Check it's now using the right version**:

   ```bash
   python --version
   which python
   ```

#### 💡 Step 4: Upgrade pip

Now that you're using Python 3.12:

```bash
python -m ensurepip --upgrade
python -m pip install --upgrade pip
```

---

### Alternative: System-Wide Installation (if you prefer not to use pyenv)

1. **Download source**:

   ```bash
   wget https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tgz
   tar -xvzf Python-3.12.3.tgz
   cd Python-3.12.3
   ```

2. **Build and install**:

   ```bash
   ./configure --enable-optimizations
   make -j$(nproc)
   sudo make altinstall  # Use altinstall to avoid overwriting system python
   ```

3. **Verify**:

   ```bash
   python3.12 --version
   ```

---

### Notes:

* Don’t uninstall Python 2.7 if it’s the system default (many OS tools rely on it).
* Always use `python3` and `pip3` going forward.
* If you use virtual environments (`venv` or `virtualenv`), you can isolate new Python versions easily.

Would you like help choosing between `pyenv` and system-wide installation based on your use case?
