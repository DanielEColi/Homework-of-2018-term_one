#########################
###  DEFINE VARIABLES ###
#########################
set DesignName	"Key1x1"
set FamilyName	"SPARTAN3E"
set DeviceName	"xc3s250e"
set PackageName	"TQ144"
set SpeedGrade	"-4"
set TopModule	"Key1x1"
set EdifFile	"Key1x1.edn"
if {![file exists $DesignName.ise]} {

project new $DesignName.ise

project set family $FamilyName
project set device $DeviceName
project set package $PackageName
project set speed $SpeedGrade

xfile add $EdifFile
if {[file exists synplicity.ucf]} {
    xfile add synplicity.ucf
}

project set "Netlist Translation Type" "Timestamp"
project set "Other NGDBuild Command Line Options" "-verbose"
project set "Generate Detailed MAP Report" TRUE

project close
}


file delete -force $DesignName\_xdb

project open $DesignName.ise

process run "Implement Design" -force rerun_all

project close

