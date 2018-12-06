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
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-v-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-v-uplatex.dvi ; \
	done

platex:
	for opt in default deluxe expert bold noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotftest.tex ; \
		mv uotftest.dvi uotftest-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotftest.tex ; \
		mv uotftest.dvi uotftest-$$opt-v-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-v-platex.dvi ; \
	done

clean:
	rm *.aux *.log *.dvi *.pdf
