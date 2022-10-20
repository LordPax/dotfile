from ranger.api.commands import *
import os
import subprocess

class encrypt(Command):
    """:encrypt

    Encrypts the file with gpg
    """

    def execute(self):
        filename = self.fm.thisdir.get_selection()

        if len(filename) == 0:
            self.fm.notify("No file specified", bad=True)
            return

        command = ['crypt', '-e']

        for file in filename:
            command.append(file.path)

        subprocess.call(command)

class decrypt(Command):
    """:decrypt

    Decrypts the file with gpg
    """

    def execute(self):
        filename = self.fm.thisdir.get_selection()

        if len(filename) == 0:
            self.fm.notify("No file specified", bad=True)
            return

        command = ['crypt', '-d']

        for file in filename:
            command.append(file.path)

        subprocess.call(command)
