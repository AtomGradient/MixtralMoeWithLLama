
#!/bin/sh
awget=`which wget` 
if [[ -n "$awget" ]]
then
    echo "wget exist! will start downloading\n"
else
    echo "wget command is not exist!please use  [ brew install wget ] to install\n"
    exit 0
fi

acmake=`which cmake` 
if [[ -n "$acmake" ]]
then
    echo "cmake exist!\n"
else
    echo "cmake command is not exist! please use  [ brew install cmake ] to install\n"
    exit 0
fi

if ! [ -f ./mixtral-8x7b-instruct-v0.1.Q2_K.gguf ]; then
    echo "mixtral-8x7b-instruct-v0.1.Q2_K does not exist, begin download it into current folder"
    wget https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GGUF/resolve/main/mixtral-8x7b-instruct-v0.1.Q2_K.gguf
else
    echo "Mixtral Moe Q2_K GGUF already exist!😊\n"
fi

echo "Now starts install LLama.cpp\nPlease wait for a while\n"
echo `pwd`
pushd llama.cpp
echo `pwd`
mkdir build
pushd build
cmake ..
cmake --build . --config Release