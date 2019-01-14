#!/bin/bash

# This file computes the PLUMED metric indicated in $script
# on all of the trajectory files in $indir. The results 
# are printed in stdout.

# You only need to run this file if you change the definition
# of the metric. The current results are in metric.dat

script=$HOME/practice/protein_ligand_vector.plumed 
indir=/mnt/scratch/shared/markov/binding/1/filtered

# Loop over all files ending by .xtc
for tj in `find $indir -name \*.xtc -and -not -name .\*`; do
  # Output file name
  outname=`basename $tj`
  echo Running plumed on $tj >&2
  plumed driver --plumed $script \
    --pdb $indir/filtered.pdb \
    --mf_xtc $tj | \
       egrep "^ " | sed "s+^+$outname+"
done

