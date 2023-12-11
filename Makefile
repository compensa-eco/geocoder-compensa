.PHONY: docs

setup:
	python -m pip install .

init:
	pip install -r requirements.txt

test:
	flake8 --ignore=E305,E501 geocoder
	py.test --cov=./ tests
	coverage html

clean:
	python setup.py clean --all
	rm -rf build-*
	rm -rf *egg*
	rm -rf dist

tox:
	tox

publish:
	python -m build

docs:
	make -C docs html
	xdg-open docs/_build/html/index.html
