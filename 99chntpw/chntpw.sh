#!/bin/sh

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

# Init file for chntpw dracut module

PATH="/bin:/sbin:/usr/bin:/usr/sbin"
TERM=linux
export PATH TERM
cd /

busybox --install -s

setlogcons 1

# Go for stage two script
openvt -c 3 -s -w -- /bin/bash /scripts/stage2
