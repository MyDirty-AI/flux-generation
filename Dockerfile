FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

# cg-use-everywhere
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

# IP-Adapter Flux - tested on ComfyUI commit bda1482 which maps to 5.7.1
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/Shakker-Labs/ComfyUI-IPAdapter-Flux.git && \
    cd ComfyUI-IPAdapter-Flux && \
    pip install -r requirements.txt

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
