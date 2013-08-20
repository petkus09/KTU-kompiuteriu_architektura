
########## Tcl recorder starts at 05/21/13 11:18:02 ##########

set version "1.4"
set proj_dir "C:/ispLEVER_Classic/examples"
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
if [runCmd "\"$cpld_bin/ahdl2blf\" testas.abv -vec -ovec testas.tmv -sim 213 Automatas -def _AMDMACH_ _MACH_ _LSI5K_ _LATTICE_ _PLSI_ _MACH4ZE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/sch2tf\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -prj 213 automatas -ext .lsi operacinis.sch "] {
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
if [runCmd "\"$cpld_bin/mblflink\" \"operacinis.bl1\" -o \"213 automatas.bl2\" -omod \"213 automatas\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj 213 automatas -lci 213 automatas.lct -log 213 automatas.imp -err automake.err -tti 213 automatas.bl2 -dir c:/users/petku_000/documents/darbas/kompiuteriu elementai ir architektura/213 automatas"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci 213 automatas.lct -blifopt 213 automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" \"213 automatas\".bl2 -sweep -mergefb -err automake.err -o \"213 automatas\".bl3 @213 automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci 213 automatas.lct -dev lc4k -diofft 213 automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" \"213 automatas\".bl3 -family AMDMACH -idev van -o \"213 automatas\".bl4 -oxrf \"213 automatas\".xrf -err automake.err @213 automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci 213 automatas.lct -dev lc4k -prefit 213 automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp 213 automatas.bl4 -out 213 automatas.bl5 -err automake.err -log 213 automatas.log -mod operacinis @213 automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open 213 automatas.rs1 w} rspFile] {
	puts stderr "Cannot create response file 213 automatas.rs1: $rspFile"
} else {
	puts $rspFile "-i \"213 automatas\".bl5 -lci \"213 automatas\".lct -d m4e_64_48u -lco \"213 automatas\".lco -html_rpt -fti 213 automatas.fti -fmt PLA -tto 213 automatas.tt4 -nojed -eqn 213 automatas.eq3 -tmv testas.tmv
-rpt_num 1
"
	close $rspFile
}
if [catch {open 213 automatas.rs2 w} rspFile] {
	puts stderr "Cannot create response file 213 automatas.rs2: $rspFile"
} else {
	puts $rspFile "-i \"213 automatas\".bl5 -lci \"213 automatas\".lct -d m4e_64_48u -lco \"213 automatas\".lco -html_rpt -fti 213 automatas.fti -fmt PLA -tto 213 automatas.tt4 -eqn 213 automatas.eq3 -tmv testas.tmv
-rpt_num 1
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lpf4k\" \"@213 automatas.rs2\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete 213 automatas.rs1
file delete 213 automatas.rs2
if [runCmd "\"$cpld_bin/tda\" -i 213 automatas.bl5 -o 213 automatas.tda -lci 213 automatas.lct -dev m4e_64_48u -family lc4k -mod operacinis -ovec testas.tmv -err tda.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open 213 automatas.rss w} rspFile] {
	puts stderr "Cannot create response file 213 automatas.rss: $rspFile"
} else {
	puts $rspFile "-i \"213 automatas.tt4\" -lib \"$install_dir/ispcpld/dat/lc4k\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"213 automatas.tt4\" -lci \"213 automatas.lct\" -prj \"213 automatas\" -dir \"c:/users/petku_000/documents/darbas/kompiuteriu elementai ir architektura/213 automatas\" -err automake.err -log \"213 automatas.nrp\" -exf \"operacinis.exf\"  -netlist edif
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@213 automatas.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete 213 automatas.rss
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

########## Tcl recorder end at 05/21/13 11:18:03 ###########


########## Tcl recorder starts at 05/21/13 11:18:18 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/impsrc\"  -prj 213 automatas -lci 213 automatas.lct -log 213 automatas.imp -err automake.err -tti 213 automatas.bl2 -dir c:/users/petku_000/documents/darbas/kompiuteriu elementai ir architektura/213 automatas"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci 213 automatas.lct -blifopt 213 automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" \"213 automatas\".bl2 -sweep -mergefb -err automake.err -o \"213 automatas\".bl3 @213 automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci 213 automatas.lct -dev lc4k -diofft 213 automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" \"213 automatas\".bl3 -family AMDMACH -idev van -o \"213 automatas\".bl4 -oxrf \"213 automatas\".xrf -err automake.err @213 automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci 213 automatas.lct -dev lc4k -prefit 213 automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp 213 automatas.bl4 -out 213 automatas.bl5 -err automake.err -log 213 automatas.log -mod operacinis @213 automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open 213 automatas.rs1 w} rspFile] {
	puts stderr "Cannot create response file 213 automatas.rs1: $rspFile"
} else {
	puts $rspFile "-i \"213 automatas\".bl5 -lci \"213 automatas\".lct -d m4e_64_48u -lco \"213 automatas\".lco -html_rpt -fti 213 automatas.fti -fmt PLA -tto 213 automatas.tt4 -nojed -eqn 213 automatas.eq3 -tmv testas.tmv
-rpt_num 1
"
	close $rspFile
}
if [catch {open 213 automatas.rs2 w} rspFile] {
	puts stderr "Cannot create response file 213 automatas.rs2: $rspFile"
} else {
	puts $rspFile "-i \"213 automatas\".bl5 -lci \"213 automatas\".lct -d m4e_64_48u -lco \"213 automatas\".lco -html_rpt -fti 213 automatas.fti -fmt PLA -tto 213 automatas.tt4 -eqn 213 automatas.eq3 -tmv testas.tmv
-rpt_num 1
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lpf4k\" \"@213 automatas.rs2\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete 213 automatas.rs1
file delete 213 automatas.rs2
if [runCmd "\"$cpld_bin/tda\" -i 213 automatas.bl5 -o 213 automatas.tda -lci 213 automatas.lct -dev m4e_64_48u -family lc4k -mod operacinis -ovec testas.tmv -err tda.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open 213 automatas.rss w} rspFile] {
	puts stderr "Cannot create response file 213 automatas.rss: $rspFile"
} else {
	puts $rspFile "-i \"213 automatas.tt4\" -lib \"$install_dir/ispcpld/dat/lc4k\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"213 automatas.tt4\" -lci \"213 automatas.lct\" -prj \"213 automatas\" -dir \"c:/users/petku_000/documents/darbas/kompiuteriu elementai ir architektura/213 automatas\" -err automake.err -log \"213 automatas.nrp\" -exf \"operacinis.exf\"  -netlist edif
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@213 automatas.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete 213 automatas.rss
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

########## Tcl recorder end at 05/21/13 11:18:18 ###########


########## Tcl recorder starts at 05/21/13 11:18:32 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/impsrc\"  -prj 213 automatas -lci 213 automatas.lct -log 213 automatas.imp -err automake.err -tti 213 automatas.bl2 -dir c:/users/petku_000/documents/darbas/kompiuteriu elementai ir architektura/213 automatas"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci 213 automatas.lct -blifopt 213 automatas.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" \"213 automatas\".bl2 -sweep -mergefb -err automake.err -o \"213 automatas\".bl3 @213 automatas.b2_ "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci 213 automatas.lct -dev lc4k -diofft 213 automatas.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" \"213 automatas\".bl3 -family AMDMACH -idev van -o \"213 automatas\".bl4 -oxrf \"213 automatas\".xrf -err automake.err @213 automatas.d0 "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci 213 automatas.lct -dev lc4k -prefit 213 automatas.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -blif -inp 213 automatas.bl4 -out 213 automatas.bl5 -err automake.err -log 213 automatas.log -mod operacinis @213 automatas.l0  -sc"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open 213 automatas.rs1 w} rspFile] {
	puts stderr "Cannot create response file 213 automatas.rs1: $rspFile"
} else {
	puts $rspFile "-i \"213 automatas\".bl5 -lci \"213 automatas\".lct -d m4e_64_48u -lco \"213 automatas\".lco -html_rpt -fti 213 automatas.fti -fmt PLA -tto 213 automatas.tt4 -nojed -eqn 213 automatas.eq3 -tmv testas.tmv
-rpt_num 1
"
	close $rspFile
}
if [catch {open 213 automatas.rs2 w} rspFile] {
	puts stderr "Cannot create response file 213 automatas.rs2: $rspFile"
} else {
	puts $rspFile "-i \"213 automatas\".bl5 -lci \"213 automatas\".lct -d m4e_64_48u -lco \"213 automatas\".lco -html_rpt -fti 213 automatas.fti -fmt PLA -tto 213 automatas.tt4 -eqn 213 automatas.eq3 -tmv testas.tmv
-rpt_num 1
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lpf4k\" \"@213 automatas.rs2\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete 213 automatas.rs1
file delete 213 automatas.rs2
if [runCmd "\"$cpld_bin/tda\" -i 213 automatas.bl5 -o 213 automatas.tda -lci 213 automatas.lct -dev m4e_64_48u -family lc4k -mod operacinis -ovec testas.tmv -err tda.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open 213 automatas.rss w} rspFile] {
	puts stderr "Cannot create response file 213 automatas.rss: $rspFile"
} else {
	puts $rspFile "-i \"213 automatas.tt4\" -lib \"$install_dir/ispcpld/dat/lc4k\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"213 automatas.tt4\" -lci \"213 automatas.lct\" -prj \"213 automatas\" -dir \"c:/users/petku_000/documents/darbas/kompiuteriu elementai ir architektura/213 automatas\" -err automake.err -log \"213 automatas.nrp\" -exf \"operacinis.exf\"  -netlist edif
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@213 automatas.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete 213 automatas.rss
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

########## Tcl recorder end at 05/21/13 11:18:32 ###########

