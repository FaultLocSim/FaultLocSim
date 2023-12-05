import os
import pandas as pd
import runcmd
import sys

# python main.py 1
if __name__ == '__main__':
    bugs = pd.read_csv("../../VerilatorRepository.csv")
    ids = int(sys.argv[1])

    if not os.path.exists("../../coverage/verilator/bug_coverage"):
        os.makedirs("../../coverage/verilator/bug_coverage")

    for bug_id in [ids]:
        # make project directory and testcase directory
        project_dir = "../../project"
        save_testcase_dir = "../../testcase/verilator/bug_{:02}/".format(int(bug_id))
        if not os.path.exists(save_testcase_dir):
            os.makedirs(save_testcase_dir)
        # change project to fix version
        fix_version = bugs[bugs.id == bug_id]['fix version'].to_list()[0]
        command = "cd {}/verilator && git checkout -f {}".format(project_dir,fix_version)
        runcmd.exccmd(command)
        run_command_pl = bugs[bugs.id == bug_id]['command'].to_list()[0].split("/")[-1]
        # save the bug testcase
        run_command_relative_files = run_command_pl.replace(".pl", ".*")
        command = "/bin/cp -rf {}/verilator/test_regress/t/{} {}".format(project_dir, run_command_relative_files, save_testcase_dir)
        runcmd.exccmd(command)

        # change project to bug version
        bug_version = bugs[bugs.id == bug_id]['bug version'].to_list()[0]
        command = "cd {}/verilator && git checkout -f {}".format(project_dir, bug_version)
        runcmd.exccmd(command)
        # make
        print("make...")
        command = "cd {}/verilator && autoconf && export VERILATOR_ROOT={}/verilator && ./configure --enable-longtests --enable-coverage CXX=g++ && make -j `nproc`".format(project_dir,project_dir)
        res = runcmd.exccmd(command)
        # copy testcase to test_regress/t/ directory
        command = "/bin/cp -rf {}* {}/verilator/test_regress/t/".format(save_testcase_dir, project_dir)
        runcmd.exccmd(command)
        # run testcase and get the test result
        command = "cd {}/verilator/test_regress/t && ./{}".format(project_dir, run_command_pl)
        result_lines = runcmd.exccmd(command)
        # bug output
        print("\n".join(result_lines))

        # clear old coverage info
        delete_command = "cd " + project_dir + "/verilator" + " && find . -name \"*.gcda\" -type f -delete && rm -rf results coverage.info coverage1.info"
        runcmd.exccmd(delete_command)

        # obtain coverage info
        for line in result_lines:
            if line.startswith("\tperl "):
                run_command = line.replace("\tperl ", "")
                run_command = "cd {}/verilator/test_regress && perl ".format(project_dir) + run_command.split("    > ")[0]
                print(run_command)
                runcmd.exccmd(run_command)
                break
        collect_coverage_cmd = "cd " + project_dir + "/verilator && lcov -c -d . -o coverage.info && lcov -r coverage.info *obj_opt/verilog* -o coverage1.info && rm -rf coverage.info && mv coverage1.info coverage.info"
        runcmd.exccmd(collect_coverage_cmd)
        cp_command = "/bin/cp -rf " + project_dir + "/verilator/coverage.info ../../coverage/verilator/bug_coverage/coverage_bug_{:02}.info".format(
            int(bug_id))
        runcmd.exccmd(cp_command)

