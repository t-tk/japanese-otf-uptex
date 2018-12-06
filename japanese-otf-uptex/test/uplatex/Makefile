UPTEX = uptex
PTEX = ptex
UPLATEX = uplatex
PLATEX = platex
DVIPS = dvips
DVIPDFMX = dvipdfmx
PDVITYPE = pdvitype

all: uplatex platex

uplatex:
	for opt in default deluxe expert bold noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotftest.tex ; \
		mv uotftest.dvi uotftest-$$opt-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-uplatex.dvi ; \
	done

platex:
	for opt in default deluxe expert bold noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotftest.tex ; \
		mv uotftest.dvi uotftest-$$opt-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-platex.dvi ; \
	done

clean:
	rm *.aux *.log *.dvi *.pdf
