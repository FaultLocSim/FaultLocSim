import os
import pandas as pd
import sys
import runcmd

if __name__ == '__main__':
    bugs = pd.read_csv("../../IverilogRepository.csv")
    ids = int(sys.argv[1])

    if not os.path.exists("../../coverage/iverilog/bug_coverage"):
        os.makedirs("../../coverage/iverilog/bug_coverage")

    work_path = os.path.abspath("../../")
    for bug_id in [ids]:
        bug_version = bugs[bugs.id == bug_id]['bug version'].values[0]
        bug_command = bugs[bugs.id == bug_id]['command'].values[0]
        bug_branch = bugs[bugs.id == bug_id]['branch'].values[0]

        # checkout to bug version and install iverilog
        command = "cd ../../project/iverilog && git checkout -f {}".format(bug_version)
        runcmd.exccmd(command)
        print("make...")
        command = "cd ../../project/iverilog && sh autoconf.sh && ./configure CXXFLAGS='-g -O2 -fprofile-arcs -ftest-coverage' CFLAGS='-g -O2 -fprofile-arcs -ftest-coverage' LDFLAGS='-fprofile-arcs -ftest-coverage' CPPFLAGS='-fprofile-arcs -ftest-coverage' --prefix={}/project/runfile && make && make install".format(work_path)
        runcmd.exccmd(command)

        # clear old coverage info
        delete_command = "cd ../../project/iverilog && find . -name \"*.gcda\" -type f -delete && rm -rf coverage.info coverage1.info"
        runcmd.exccmd(delete_command)

        # copy testcase to work directory
        command = "/bin/cp -f ../../testcase/iverilog/bug_{:02}/* ../../project/runfile/bin/".format(bug_id)
        runcmd.exccmd(command)

        command = "cd ../../project/runfile/bin && {}".format(bug_command)
        res = runcmd.exccmd(command)
        # bug output
        print("\n".join(res))

        collect_coverage_cmd = "cd ../../project/iverilog && lcov -c -d . -o coverage.info && lcov -r coverage.info *stdout* -o coverage1.info && rm -rvf coverage.info && mv coverage1.info coverage.info"
        runcmd.exccmd(collect_coverage_cmd)

        # copy coverage file to collection position
        runcmd.exccmd("/bin/cp -f ../../project/iverilog/coverage.info ../../coverage/iverilog/bug_coverage/coverage_bug_{:02}.info".format(bug_id))

