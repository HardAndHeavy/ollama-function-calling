SAIGA_LLAMA_MODEL = model-f16
GORILLA_CODER_MODEL = gorilla-openfunctions-v2-q6_K

seed-saiga-llama:
	if [ ! -f "./data/models/$(SAIGA_LLAMA_MODEL).gguf" ]; then \
		sudo wget -O ./data/models/$(SAIGA_LLAMA_MODEL).gguf https://huggingface.co/IlyaGusev/saiga_llama3_8b_gguf/resolve/main/$(SAIGA_LLAMA_MODEL).gguf?download=true; fi
	docker exec ollama ollama create saiga_llama3_8b_f16 -f /modelfiles/Modelfile_$(SAIGA_LLAMA_MODEL)

seed-gorilla-llama:
	if [ ! -f "./data/models/$(GORILLA_CODER_MODEL).gguf" ]; then \
		sudo wget -O ./data/models/$(GORILLA_CODER_MODEL).gguf https://huggingface.co/gorilla-llm/gorilla-openfunctions-v2-gguf/resolve/main/$(GORILLA_CODER_MODEL).gguf?download=true; fi 
	docker exec ollama ollama create gorilla-v2_q6_K -f /modelfiles/Modelfile_$(GORILLA_CODER_MODEL)

seed-llava:
	docker exec ollama ollama pull llava:34b
