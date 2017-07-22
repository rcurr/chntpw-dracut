#!/bin/bash

# This file is part of chntpw dracut module.

# chntpw dracut module  Copyright (C) 2017  Russell Currie

# chntpw dracut module is free software: you can redistribute it and/or modify it under the
# terms of the GNU Lesser General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.

# chntpw dracut module is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public License along
# with chntpw dracut module.  If not, see <http://www.gnu.org/licenses/>.

command -v

check () {
    return 0
}

depends() {
    echo base busybox bash kernel-modules
    return 0
}

install() {
    inst_multiple samusrgrp chntpw reged sampasswd setlogcons ntfs-3g
    inst_hook mount 99 "$moddir/chntpw.sh"
    cp -r "${moddir}/scripts" "${initdir}"
    dracut_need_initqueue
}
