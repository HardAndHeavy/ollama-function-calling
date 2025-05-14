include make-seed.mk

gen:
	docker run --rm -it \
		-e HSA_OVERRIDE_GFX_VERSION=$(HSA_OVERRIDE_GFX_VERSION) \
		-v $(CURDIR):/ansible \
		-v ./secure:/ansible/secure \
		willhallonline/ansible:latest ansible-playbook ansible/gen.yml \
		-i ansible/gen \
		-vv

run:
	docker compose up -d

run-cpu:
	docker compose -f docker-compose.cpu.yaml up -d

run-1c:
	docker compose -f docker-compose.1c.cuda.yaml up -d

stop:
	docker compose stop
