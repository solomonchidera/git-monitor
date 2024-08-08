# Avoid that merge conflict
# Add this to your ~/.zshrc, ~/.bashrc file

function git_pull_on_cd() {
  # Check if the current directory is a Git repository
  if [ -d .git ]; then
    # Check for local changes

    if ! git diff --quiet --ignore-submodules; then
      read -q "response?Stash local changes and run git pull? (y/n) "
      if [[ $response =~ ^[yY]$ ]]; then
        git stash push --include-untracked
        echo "Running git pull..."
        git pull --no-edit --no-verify
      else
        echo "Skipping git pull."
      fi
    fi
}

# Call the function whenever the directory changes
chpwd() {
  git_pull_on_cd
}
