# Add this to your ~/.zshrc, ~/.bashrc file

function git_pull_on_cd() {
  # Check if the current directory is a Git repository
  if [ -d .git ]; then
    # Check for local changes
    if ! git diff --quiet --ignore-submodules; then
      echo "Local changes detected. Skipping git pull."
    else
      echo "Running git pull..."
      try
        git pull --no-edit --no-verify
      catch
        echo "Network error detected exiting..."
    fi
  fi
}

# Call the function whenever the directory changes
chpwd() {
  git_pull_on_cd
}
