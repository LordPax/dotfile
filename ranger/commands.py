from ranger.api.commands import *
import os
import subprocess

class encrypt(Command):
    """:encrypt

    Encrypts the file with aescrypt
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

    Decrypts the file with aescrypt
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

class fzf(Command):
    """:fzf

    Search file with fzf
    """

    def execute(self):
        fzf = self.fm.execute_command('fzf', stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))

            if os.path.isfile(fzf_file):
                self.fm.select_file(fzf_file)
            else:
                self.fm.cd(fzf_file)

class extract(Command):
    """:extract

    Extracts the selected archive
    """

    def execute(self):
        filename = self.fm.thisdir.get_selection()

        if len(filename) == 0:
            self.fm.notify("No file specified", bad=True)
            return

        for file in filename:
            ext = self.fm.run("ext \"{}\"".format(file.path))

            if ext.returncode == 0:
                self.fm.notify("Extracted {}".format(file.basename))
            else:
                self.fm.notify("Failed to extract {}".format(file.basename), bad=True)

class openInTmuxWindow(Command):
    """:openInOtherWindow

    Opens the current directory in another window
    """

    def execute(self):
        filename = self.fm.thisdir.get_selection()[0]
        self.fm.run("tmux new-window 'mimeopen {}'".format(filename.path))

class replaceSpaceWithUnderscore(Command):
    """:replaceSpaceWithUnderscore

    Replaces spaces in the filename with underscores
    """

    def execute(self):
        filename = self.fm.thisdir.get_selection()

        if len(filename) == 0:
            self.fm.notify("No file specified", bad=True)
            return

        for file in filename:
            os.rename(file.path, file.path.replace(' ', '_'))

        self.fm.notify("Replaced spaces with underscores")
