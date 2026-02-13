# Acoustic_Analysis
examining the different phonological properties of a language to map its salient features

## How to use:
-Get WAV audio files and their respective TextGrid annotations of the same name in a folder in the directory.

## Code structure
-Use extract formants to get basic values like F1, F2, F3 and duration of the phonemes in the sound files which can be used for other statistical analyses.
-bhm file can be used to calculate the Bark, Hertz and Mel values of each phonemein the sound files.
-vot can be used to calculate the voice onset time of the consonants,preferabe in another data folder for efficient working of the code. The positiveor negative value of VOT must be inferred from the waveform analysis of the sound files.
-diphthongs code can be used for getting the f0 value at 100 time points of the vowel to plot diphthong trajectory paths.
-VowelPlot file takes select columns of the output of extract formants as input, and outputs individual and comparative vowel spaces and scatterplots of all the vowel entries.

## Installation and usage
1. Clone the repository:
```bash
   git clone [https://github.com/Darshini-CogSci/Acoustic_Analysis.git](https://github.com/Darshini-CogSci/Acoustic_Analysis.git)
