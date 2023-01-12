#!/usr/bin/env bash

if xpath=$( xcode-select --print-path ) &&
  test -d "${xpath}" && test -x "${xpath}" ; then
  echo "Xcode Installed"
else
  xcode-select --install
fi

#softwareupdate --install-rosetta --agree-to-license

pip3 install --upgrade pip 2>/dev/null 

which -s ansible
if [[ $? != 0 ]] ; then
  pip3 install ansible
else
  echo "Ansible Installed"
fi

echo "Installing requirements..."
#ansible-galaxy install -r requirements.yml --force

ansible-playbook main.yml --ask-become-pass
