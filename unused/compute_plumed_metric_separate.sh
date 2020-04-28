#!/bin/bash

indir=/mnt/scratch/shared/markov/binding/1/filtered
outdir=$HOME/metrics

mkdir -p $outdir

# Loop over all files ending by .xtc
for tj in `find $indir -name \*.xtc -and -not -name .\*`; do
  # Output file name
  outname=`basename $tj .xtc`
  echo Running plumed on $tj
  plumed driver --plumed ~/practice/protein_ligand_vector.plumed \
    --pdb $indir/filtered.pdb \
    --mf_xtc $tj | \
       egrep "^ " > $outdir/$outname.metric
done

