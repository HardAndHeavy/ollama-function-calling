# Ollama function calling demo
Demo for function calling in [Ollama](https://github.com/ollama/ollama/) via the [pipelines](https://github.com/open-webui/pipelines) plugin of the [Open WebUI](https://github.com/open-webui/open-webui) web interface. Tested on AMD Radeon RX 7900 XTX.

### Requirements
- Ubuntu
- wget
- make
- Docker
- git
- ROCm (see the installation in [transformers-rocm-docker](https://github.com/HardAndHeavy/transformers-rocm-docker?tab=readme-ov-file#install-rocm))

### Launch
```bash
git clone https://github.com/HardAndHeavy/ollama-function-calling
cd ollama-function-calling
make gen
make run
make seed-saiga-llama
```

At the first start, a lengthy initialization process will take place. When the process is completed, Ollama will be available at http://localhost.

### Demo
```
user: leftovers in the warehouse
ollama: The product in stock is estimated at $3309 as of 03 December 2024.
user: yesterday
ollama: The product in stock was estimated at $3306 at 02 December 2024.
user: a week ago
ollama: The product in stock was estimated at $3251 as of 25 November 2024.
```
