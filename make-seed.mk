SAIGA_LLAMA_MODEL = model-f16

seed-saiga-llama:
	if [ ! -f "./data/models/$(SAIGA_LLAMA_MODEL).gguf" ]; then \
		sudo wget -O ./data/models/$(SAIGA_LLAMA_MODEL).gguf https://huggingface.co/IlyaGusev/saiga_llama3_8b_gguf/resolve/main/$(SAIGA_LLAMA_MODEL).gguf?download=true; fi
	docker exec ollama ollama create saiga_llama3_8b_f16 -f /modelfiles/Modelfile_$(SAIGA_LLAMA_MODEL)

seed-qwq:
	docker exec ollama ollama pull qwq:32b
