
########## Tcl recorder starts at 05/09/12 18:16:14 ##########

set version "1.5"
set proj_dir "D:/Studijos/Automatai/Lukas"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:16:14 ###########


########## Tcl recorder starts at 05/09/12 18:41:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:41:25 ###########


########## Tcl recorder starts at 05/09/12 18:42:48 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:42:48 ###########


########## Tcl recorder starts at 05/09/12 18:43:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:43:20 ###########


########## Tcl recorder starts at 05/09/12 18:43:21 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:43:21 ###########


########## Tcl recorder starts at 05/09/12 18:43:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:43:30 ###########


########## Tcl recorder starts at 05/09/12 18:43:47 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:43:47 ###########


########## Tcl recorder starts at 05/09/12 18:44:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:44:28 ###########


########## Tcl recorder starts at 05/09/12 18:59:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:59:46 ###########


########## Tcl recorder starts at 05/09/12 18:59:50 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" valdantis.bl0 -o valdantis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 18:59:50 ###########


########## Tcl recorder starts at 05/09/12 19:00:29 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:00:29 ###########


########## Tcl recorder starts at 05/09/12 19:00:50 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:00:50 ###########


########## Tcl recorder starts at 05/09/12 19:01:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:01:20 ###########


########## Tcl recorder starts at 05/09/12 19:07:09 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:07:09 ###########


########## Tcl recorder starts at 05/09/12 19:10:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:10:23 ###########


########## Tcl recorder starts at 05/09/12 19:10:37 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" valdantis.bl0 -o valdantis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:10:37 ###########


########## Tcl recorder starts at 05/09/12 19:11:12 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:11:12 ###########


########## Tcl recorder starts at 05/09/12 19:27:57 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:27:57 ###########


########## Tcl recorder starts at 05/09/12 19:28:00 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:28:00 ###########


########## Tcl recorder starts at 05/09/12 19:33:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:33:11 ###########


########## Tcl recorder starts at 05/09/12 19:33:15 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:33:15 ###########


########## Tcl recorder starts at 05/09/12 19:34:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:34:55 ###########


########## Tcl recorder starts at 05/09/12 19:34:57 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup operacinis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bls\" -o \"operacinis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" operacinis.bl0 -o operacinis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:34:57 ###########


########## Tcl recorder starts at 05/09/12 19:36:59 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i operacinis.bl0 -o operacinis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod operacinis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:36:59 ###########


########## Tcl recorder starts at 05/09/12 19:40:01 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:40:01 ###########


########## Tcl recorder starts at 05/09/12 19:40:18 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod operacinis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:40:18 ###########


########## Tcl recorder starts at 05/09/12 19:44:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:44:46 ###########


########## Tcl recorder starts at 05/09/12 19:44:55 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup operacinis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bls\" -o \"operacinis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i operacinis.bl0 -o operacinis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod operacinis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:44:55 ###########


########## Tcl recorder starts at 05/09/12 19:54:54 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 19:54:54 ###########


########## Tcl recorder starts at 05/09/12 20:06:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 20:06:16 ###########


########## Tcl recorder starts at 05/09/12 20:09:29 ##########

set version "1.5"
set proj_dir "D:/Studijos/Automatai/Simas"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 20:09:29 ###########


########## Tcl recorder starts at 05/09/12 20:13:14 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 20:13:14 ###########


########## Tcl recorder starts at 05/09/12 21:09:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 21:09:30 ###########


########## Tcl recorder starts at 05/09/12 21:39:39 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 21:39:39 ###########


########## Tcl recorder starts at 05/09/12 21:56:34 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 21:56:34 ###########


########## Tcl recorder starts at 05/09/12 22:03:34 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:03:34 ###########


########## Tcl recorder starts at 05/09/12 22:03:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:03:35 ###########


########## Tcl recorder starts at 05/09/12 22:03:43 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" valdantis.bl0 -o valdantis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:03:43 ###########


########## Tcl recorder starts at 05/09/12 22:04:16 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:04:16 ###########


########## Tcl recorder starts at 05/09/12 22:16:24 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:16:24 ###########


########## Tcl recorder starts at 05/09/12 22:19:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:19:53 ###########


########## Tcl recorder starts at 05/09/12 22:20:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:20:36 ###########


########## Tcl recorder starts at 05/09/12 22:20:40 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" valdantis.bl0 -o valdantis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:20:40 ###########


########## Tcl recorder starts at 05/09/12 22:21:34 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:21:34 ###########


########## Tcl recorder starts at 05/09/12 22:21:37 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" valdantis.bl0 -o valdantis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:21:37 ###########


########## Tcl recorder starts at 05/09/12 22:22:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:22:53 ###########


########## Tcl recorder starts at 05/09/12 22:22:56 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" valdantis.bl0 -o valdantis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:22:56 ###########


########## Tcl recorder starts at 05/09/12 22:23:29 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:23:29 ###########


########## Tcl recorder starts at 05/09/12 22:34:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:34:59 ###########


########## Tcl recorder starts at 05/09/12 22:37:14 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:37:14 ###########


########## Tcl recorder starts at 05/09/12 22:37:18 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:37:18 ###########


########## Tcl recorder starts at 05/09/12 22:39:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:39:22 ###########


########## Tcl recorder starts at 05/09/12 22:39:25 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:39:25 ###########


########## Tcl recorder starts at 05/09/12 22:44:15 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:44:15 ###########


########## Tcl recorder starts at 05/09/12 22:44:18 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" valdantis.bl0 -o valdantis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:44:18 ###########


########## Tcl recorder starts at 05/09/12 22:44:49 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:44:49 ###########


########## Tcl recorder starts at 05/09/12 22:47:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:47:56 ###########


########## Tcl recorder starts at 05/09/12 22:48:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:48:03 ###########


########## Tcl recorder starts at 05/09/12 22:48:08 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:48:08 ###########


########## Tcl recorder starts at 05/09/12 22:49:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:49:23 ###########


########## Tcl recorder starts at 05/09/12 22:49:27 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" valdantis.bl0 -o valdantis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:49:27 ###########


########## Tcl recorder starts at 05/09/12 22:49:58 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:49:58 ###########


########## Tcl recorder starts at 05/09/12 22:53:00 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:53:00 ###########


########## Tcl recorder starts at 05/09/12 22:53:03 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:53:03 ###########


########## Tcl recorder starts at 05/09/12 22:53:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:53:45 ###########


########## Tcl recorder starts at 05/09/12 22:55:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:55:30 ###########


########## Tcl recorder starts at 05/09/12 22:55:35 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup operacinis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bls\" -o \"operacinis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" operacinis.bl0 -o operacinis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:55:35 ###########


########## Tcl recorder starts at 05/09/12 22:56:45 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i operacinis.bl0 -o operacinis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod operacinis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:56:45 ###########


########## Tcl recorder starts at 05/09/12 22:59:33 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 22:59:33 ###########


########## Tcl recorder starts at 05/09/12 23:07:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:07:52 ###########


########## Tcl recorder starts at 05/09/12 23:07:57 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/blif2eqn\" valdantis.bl0 -o valdantis.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj automatas -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:07:57 ###########


########## Tcl recorder starts at 05/09/12 23:08:37 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:08:37 ###########


########## Tcl recorder starts at 05/09/12 23:09:52 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:09:52 ###########


########## Tcl recorder starts at 05/09/12 23:11:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:11:56 ###########


########## Tcl recorder starts at 05/09/12 23:13:00 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:13:00 ###########


########## Tcl recorder starts at 05/09/12 23:18:44 ##########

# Commands to make the Process: 
# Functional Simulation
# - none -
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:18:44 ###########


########## Tcl recorder starts at 05/09/12 23:22:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" valdantis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:22:13 ###########


########## Tcl recorder starts at 05/09/12 23:22:18 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup valdantis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bls\" -o \"valdantis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i valdantis.bl0 -o valdantis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"valdantis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod valdantis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map valdantis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:22:18 ###########


########## Tcl recorder starts at 05/09/12 23:22:48 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" operacinis.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:22:48 ###########


########## Tcl recorder starts at 05/09/12 23:23:14 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup operacinis.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bls\" -o \"operacinis.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i operacinis.bl0 -o operacinis.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bl1\" -o \"automatas.bl2\" -omod \"automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj automatas -lci automatas.lct -log automatas.imp -err automake.err -tti automatas.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -blifopt automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" automatas.bl2 -sweep -mergefb -err automake.err -o automatas.bl3 @automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -diofft automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" automatas.bl3 -family AMDMACH -idev van -o automatas.bl4 -oxrf automatas.xrf -err automake.err @automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci automatas.lct -dev lc4k -prefit automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp automatas.bl4 -out automatas.bl5 -err automake.err -log automatas.log -mod operacinis @automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:23:14 ###########


########## Tcl recorder starts at 05/09/12 23:25:19 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:25:19 ###########


########## Tcl recorder starts at 05/09/12 23:25:57 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/09/12 23:25:58 ###########


########## Tcl recorder starts at 05/11/12 00:29:16 ##########

# Commands to make the Process: 
# Functional Simulation
# - none -
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre7 -ini simcpls.ini -unit simcp.pre7
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/11/12 00:29:16 ###########


########## Tcl recorder starts at 05/21/13 11:38:49 ##########

set version "1.4"
set proj_dir "C:/Users/petku_000/Documents/Darbas/Kompiuteriu elementai ir architektura/automatas/Simas"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Timing Simulation
# - none -
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post5 -ini simcpls.ini -all simcp.post5
-cfg machgen.fdk testas.lts -map operacinis.lsi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/21/13 11:38:49 ###########

