#EDIT BEFORE IT RUNS

#from tests.qa.jenkins.utils.tester_configs import AOL_CONF

import requests
import sys
sys.path.append('/home/ailloz/git/guardicore/tests/qa/jenkins/utils/')
from tester_configs import AOL_CONF
from copy import deepcopy

annotations = deepcopy(AOL_CONF)
annotations.update({
    'type': 'thin',
    'environment_name': 'Thin-300-Regular',
    'vcenter': '10.0.0.22',
    'build_nightly': True
})

res = requests.post('https://tester-config.gc.guardicore.com/save_details', data=annotations,
                    verify=False)
