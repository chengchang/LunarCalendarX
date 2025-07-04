.PHONY: init test clean lint build publish publish-test dev

init:
	pip install -e . 
	pip install pytest twine build pytest-cov ruff

test:
	PYTHONPATH=./ pytest -v tests/

clean:
	rm -rf dist
	rm -rf build
	rm -rf LunarCalendarX.egg-info
	find . -name __pycache__ -type d -exec rm -rf {} +
	rm -rf .pytest_cache
	rm -rf .ruff_cache

lint:
	ruff check .

build: clean
	python -m build

publish: build
	twine upload dist/*

publish-test: build
	twine check dist/*

dev:
	pip install -e .

