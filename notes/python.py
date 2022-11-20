## Python commands ##

__python run from bash terminal__
# run python code from bash
python -c "print("Hello world!")"

__python for loop__
numbers = [1,2,3,4,5]
for n in numbers:
    print(n*2)

__python get unique elements from list__
set(list_x)

__python invert dict / dictionary__
# https://stackoverflow.com/questions/483666/reverse-invert-a-dictionary-mapping
inv_map = {v: k for k, v in my_map.items()}

__python update / dictionary key name__
dictionary[new_key] = dictionary.pop(old_key)

__python print without newline, no newline__
print('Hello World!', end='')

__python check version of installed package__
package.__version__
sns.__version__
# From terminal
python --version

__python list comprehension__
# Short version of a for loop
numbers = [1,2,3,4,5]
[print(n*2) for n in numbers]

__python safer evaluation__
import ast
ast.literal_eval(vals)

__python import from path__
# Add new folder to python path for importing modules, and show python paths
import sys
sys.path.insert(0, "/home/admin")
sys.path.insert(0, "/home/admin/scripts")
print(sys.path)

__python get time, time duration__
from datetime import date
today = date.today()

from datetime import datetime
start = datetime.now()
end = datetime.now()
duration = str(end - start)

__python debug__
import pdb
pdb.set_trace()

__python parallel for loop__
# https://stackoverflow.com/questions/9786102/how-do-i-parallelize-a-simple-python-loop
from joblib import Parallel, delayed
def process(i):
    return i * i

results = Parallel(n_jobs=2)(delayed(process)(i) for i in range(10))
print(results)  # prints [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
