"""
Ansible Lookup plugin to look up the git config on the local host (i.e. the one
on which ansible itself is being run).
"""

import subprocess

from ansible import errors
from ansible.plugins import lookup
from ansible.utils import display


output = display.Display()


class LookupModule(lookup.LookupBase):
    def run(self, terms, variables=None, **kwargs):
        config_option ='.'.join(terms)
        output.debug('Git config lookup option: "%s"' % config_option)
        if not config_option:
            raise errors.AnsibleParserError('No config option specified')
        return self._get_git_config(config_option).splitlines()

    @staticmethod
    def _get_git_config(option):
        try:
            result = subprocess.check_output(['git', 'config', option])
        except CalledProcessError as err:
            raise errors.AnsibleError(
                'git config returned %d for option "%s": %s' %
                (err.returncode, option, err.output))
        except Exception as exc:
            raise errors.AnsibleError(str(exc))
        return result.decode('utf-8')
