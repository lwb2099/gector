#!/usr/bin/env python
import argparse
import sys
import re

"""
conver m2 file to two parallel files: source file and target file
modified from https://github.com/grammarly/gector/issues/181
"""
def convert(args: argparse.Namespace):
    # if len(args) != 4:
    #     print("[USAGE] %s nucle_m2_file output_src output_tgt" % sys.argv[0])
    #     sys.exit()

    input_path = args.m2
    output_src_path = args.source
    output_tgt_path = args.target

    words = []
    corrected = []
    sid = eid = 0
    prev_sid = prev_eid = -1
    pos = 0

    with open(input_path) as input_file, open(output_src_path, 'w') as output_src_file, open(output_tgt_path,
                                                                                             'w') as output_tgt_file:
        for line in input_file:
            line = line.strip()
            if line.startswith('S'):
                line = line[2:]
                words = line.split()
                corrected = ['<S>'] + words[:]
                output_src_file.write(line + '\n')
            elif line.startswith('A'):
                line = line[2:]
                info = line.split("|||")
                sid, eid = info[0].split()
                sid = int(sid) + 1;
                eid = int(eid) + 1;
                error_type = info[1]
                if error_type == "Um":
                    continue
                for idx in range(sid, eid):
                    corrected[idx] = ""
                if sid == eid:
                    if sid == 0: continue  # Originally index was -1, indicating no op
                    if sid != prev_sid or eid != prev_eid:
                        pos = len(corrected[sid - 1].split())
                    cur_words = corrected[sid - 1].split()
                    cur_words.insert(pos, info[2])
                    pos += len(info[2].split())
                    corrected[sid - 1] = " ".join(cur_words)
                else:
                    corrected[sid] = info[2]
                    pos = 0
                prev_sid = sid
                prev_eid = eid
            else:
                target_sentence = ' '.join([word for word in corrected if word != ""])
                assert target_sentence.startswith('<S>'), '(' + target_sentence + ')'
                target_sentence = target_sentence[4:]
                output_tgt_file.write(target_sentence + '\n')
                prev_sid = -1
                prev_eid = -1
                pos = 0

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-m', '--m2', help="m2 file", required=True)
    parser.add_argument('-s', '--source', help="output source file", required=True)
    parser.add_argument('-t', '--target', help="output tgt file", required=True)
    args = parser.parse_args()
    convert(args)

