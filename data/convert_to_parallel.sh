
# cd ./data/dataset/
# fce data

data_root = "./datasets"
python convert_m2_to_parallel.py -m $data_root/raw/fce/m2/fce.train.gold.bea19.m2 -s $data_root/parallel/train/fce_src -t $data_root/parallel/train/fce_tgt
python convert_m2_to_parallel.py -m $data_root/raw/fce/m2/fce.dev.gold.bea19.m2 -s $data_root/parallel/val/fce_src -t $data_root/parallel/val/fce_tgt
python convert_m2_to_parallel.py -m $data_root/raw/fce/m2/fce.test.gold.bea19.m2 -s $data_root/parallel/test/fce_src -t $data_root/parallel/test/fce_tgt

# wi+locness, only use ABC(train) and ABCN(dev,test)
python convert_m2_to_parallel.py -m $data_root/raw/wi+locness/m2/ABC.train.gold.bea19.m2 -s $data_root/parallel/train/locness_src -t $data_root/parallel/train/locness_tgt
python convert_m2_to_parallel.py -m $data_root/raw/wi+locness/m2/ABCN.dev.gold.bea19.m2 -s $data_root/parallel/val/locness_src -t $data_root/parallel/val/locness_tgt
# just move to dir
cp $data_root/raw/wi+locness/test/ABCN.test.bea19.orig $data_root/processed/test/

## lang
#python convert_m2_to_parallel.py -m ./raw/fce/m2/fce.train.gold.bea19.m2 -s ./parallel/train/fce_src -t ./parallel/train/fce_tgt
#python convert_m2_to_parallel.py -m ./raw/fce/m2/fce.train.gold.bea19.m2 -s ./parallel/train/fce_src -t ./parallel/train/fce_tgt
#python convert_m2_to_parallel.py -m ./raw/fce/m2/fce.train.gold.bea19.m2 -s ./parallel/train/fce_src -t ./parallel/train/fce_tgt