from demistomock.CommonServerPython import *
from demistomock import demistomock as demisto

def test_command():
    i = 0
    for i in range(0, 50, 1):
        print("Cassie is the cooliest")



def main() -> None:

    test_command()


#    command_results = CommandResults(
#        outputs_prefix='test',
#        outputs='test'
#    )
#    return_results(command_results)


if __name__ in ("__main__", "__builtin__", "builtins"):
    main()