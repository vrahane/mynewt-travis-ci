#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

EXIT_CODE=0

declare -a commands=(
"newt"
"newt help"
"newt version"
"newt new project"
"cd project/"
"newt install"
"newt info"
"newt build my_blinky_sim"
"newt clean my_blinky_sim"
"newt build all"
"newt test @apache-mynewt-core/kernel/os"
"newt upgrade"
"cp -r $HOME/ci/mynewt-core-targets/* targets"
"newt build nordic_pca10056_btshell"
"newt create-image nordic_pca10056_btshell 1.0.0"
"newt resign-image bin/targets/nordic_pca10056_btshell/app/apps/btshell/btshell.img"
"newt size nordic_pca10056_btshell"
"newt size -F -R nordic_pca10056_btshell"
"newt vals api app bsp build_profile compiler lib sdk target"
"newt pkg new --type=pkg sys/mylib"
"newt pkg copy apps/blinky apps/myapp"
"newt pkg move apps/myapp apps/newapp"
"newt pkg remove apps/newapp"
"newt target show"
"newt target create my_target1"
"newt target set my_target1 bsp=@apache-mynewt-core/hw/bsp/nordic_pca10056"
"newt target set my_target1 app=apps/blinky"
"newt target set my_target1 build_profile=optimized cflags=\"-DNDEBUG\""
"newt target set my_target1 syscfg=LOG_NEWTMGR=1:CONFIG_NEWTMGR=0"
"newt target config init -f my_target1"
"newt target copy my_target1 my_target2"
"newt target amend my_target1 lflags=\"-Lmylib\" syscfg=LOG_LEVEL:CONFIG_NEWTMGR=0"
"newt target delete -f my_target1"
"newt target cmake nordic_pca10056_btshell"
"newt target dep nordic_pca10056_btshell"
"newt target revdep nordic_pca10056_btshell"
"newt sync"
)

for cmd in "${commands[@]}"
do
    echo "$cmd"
    ${cmd}
    rc=$?
    [[ $rc -ne 0 ]] && EXIT_CODE=$rc
    echo "rc=$rc"
done

exit $EXIT_CODE
