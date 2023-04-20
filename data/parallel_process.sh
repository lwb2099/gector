# process parallel file to preprocessed data using preprocess_data.py

# fce

project_root="../../utils"
data_root="./datasets"
python $project_root/preprocess_data.py -s $data_root/parallel/train/fce_src -t $data_root/parallel/train/fce_tgt -o $data_root/processed/train/fce_train
python $project_root/preprocess_data.py -s $data_root/parallel/val/fce_src -t $data_root/parallel/val/fce_tgt -o $data_root/processed/val/fce_val
python $project_root/preprocess_data.py -s $data_root/parallel/test/fce_src -t ./parallel/test/fce_tgt -o ./processed/test/fce_test

# wi+locness
python $project_root/preprocess_data.py -s $data_root/parallel/train/locness_src -t $data_root/parallel/train/locness_tgt -o $data_root/processed/train/locness_train
python $project_root/preprocess_data.py -s $data_root/parallel/train/locness_src -t $data_root/parallel/train/locness_tgt -o $data_root/processed/val/locness_val


# lang-8
#python utils/preprocess_data -s ./parallel/train/fce_src -t ./parallel/train/fce_tgt -o ./processed/train fce_train
#python utils/preprocess_data -s ./parallel/train/fce_src -t ./parallel/train/fce_tgt -o ./processed/train fce_train
#



