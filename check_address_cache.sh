LAIK_LOG=1 LAIK_BACKEND=mpi LAIK_SECONDARIES=SHMEM LAIK_SHMEM_COPY_SCHEME=2 LAIK_SHMEM_RANKS_PER_ISLANDS=2 mpirun --mca btl vader,self -np 2 --map-by core --bind-to core examples/jac3d -a -r -n 10 11 &> log
cat log | grep "L00" > log0
cat log | grep "L01" > log1
echo "0: DBG Recv"
cat log0 | grep "DBG Recv"
echo "1: DBG Recv"
cat log1 | grep "DBG Recv"
echo "0: DBG Send"
cat log0 | grep "DBG Send"
echo "1: DBG Send"
cat log1 | grep "DBG Send"
echo "0: reallocating"
cat log0 | grep "DBG: reallocating"
echo "1: reallocating"
cat log1 | grep "DBG: reallocating"
