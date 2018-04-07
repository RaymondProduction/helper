# Setting the ssh key for git (for automatic authorization)

1. Create a public key if it does not exist.
To check if the ls -al ~ / .ssh command is on the key, the key is called id_rsa.pub
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

2. Starting the agent

```bash
eval "$ (ssh-agent -s)"
ssh-add ~ / .ssh / id_rsa
```

3. Copy the key into the exchange buffer using the xclip utility

```bash
$ sudo apt-get install xclip
# Downloads and installs xclip. If you do not have `apt-get`, you might need to use another installer (like` yum`)

$ xclip -sel clip <~ / .ssh / id_rsa.pub
# Copies the contents of the id_rsa.pub file to your clipboard
```

4. On GitHub we add it to the SSH and GPG keys section, the title is better than the name of the computer

5. It may not work if not done ...

```bash
git remote remove origin
git remote add origin git@github.com: <repository>
```