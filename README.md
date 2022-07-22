# VSR Code for the paper:
## A Dataset for Analysing Complex Document Layouts in the Digital Humanities and its Evaluation with Krippendorff ’s Alpha

The code was branched from https://github.com/hikopensource/DAVAR-Lab-OCR and only necessary parts to run the code on the TexBiG Dataset have been included.

### Used GPU and OS for training and testing:

Nvidia Tesla V100-PCIE with 16GB VRAM and Ubuntu 18.04.

## Installation using conda:

`conda create -n vsr_lean python=3.7`

`conda activate vsr_lean`

`conda install pytorch==1.8.1 torchvision==0.9.1 torchaudio==0.8.1 cudatoolkit=10.2 -c pytorch`

`pip install openmim`

`mim install mmcv-full=1.4.0`

`mim install mmdet=2.11.0`

`python setup.py install`

### Download the dataset

The dataset can be found under:

TODO URL-here

Since the models requires additonal text from the document pages some OCR data are available (generated with Tesseract). These data are far from perfect, but they allow training of the model. They are also included in the following link:

TODO URL-here

## Install missing models and submodules

### Preperation for training from scratch

Follow the description here to prepare the data on your own and train the models from scratch: https://github.com/hikopensource/DAVAR-Lab-OCR/tree/2c518763134331cdaeb46d12aaec61fa3b0e6a02/demo/text_layout/VSR  

Add the bert-base-uncased model to `/demo/text_layout/common/ ` 
Add the mask_rcnn model to `/demo/text_layout/common/`

### Preperation for testing with the trained model

For running a test directly on the dataset download the pretrained model from URL-here and store it as `demo/text_layout/VSR/TexBiG/log/test_texbig/publaynet_pretrained/eta/Best_checkpoint.pth`.

## Running the code

In order to run the code you will need to adapt the paths in `/demo/text_layout/VSR/TexBiG/configs/eta.py` (for example, to adapt the eta configuration).
You should link to the dataset, pre-trained model and the BERT encoder.

### Run training from scratch

`tools/train.py demo/text_layout/VSR/TexBiG/configs/eta.py`

### Run test with trained model
`tools/test.py demo/text_layout/VSR/TexBiG/configs/eta.py  
demo/text_layout/VSR/TexBiG/log/test_texbig/publaynet_pretrained/eta/Best_checkpoint.pth  
--eval bbox segm`

## Multi GPU training

`export NGPU=2` for running on two GPU's

## Cite us

```
@inproceedings{tschirschwitz2022texbig,
  title={A Dataset for Analysing Complex Document Layouts in the Digital Humanities and its Evaluation with Krippendorff ’s Alpha},
  author={Tschirschwitz, David and Klemstein, Franziska and Stein, Benno and Rodehorst, Volker},
  booktitle={DAGM German Conference on Pattern Recognition},
  year={2022},
  organization={Springer},
  note={(in press)}
}
```