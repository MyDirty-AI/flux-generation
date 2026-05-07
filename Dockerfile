FROM runpod/worker-comfyui:5.8.5-base

WORKDIR /comfyui

# cg-use-everywhere
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

# IP-Adapter Flux for character consistency
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/Shakker-Labs/ComfyUI-IPAdapter-Flux.git && \
    cd ComfyUI-IPAdapter-Flux && \
    pip install -r requirements.txt

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
