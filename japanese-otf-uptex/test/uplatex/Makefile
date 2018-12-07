UPTEX = uptex
PTEX = ptex
UPLATEX = uplatex
PLATEX = platex -kanji=utf8
DVIPS = dvips
DVIPDFMX = dvipdfmx
PDVITYPE = pdvitype

all: uplatex-otf platex-otf uplatex-sp platex-sp uplatex-article platex-article uplatex-brsg platex-brsg

otf: uplatex-otf platex-otf
sp: uplatex-sp platex-sp
art: uplatex-article platex-article
brsg: uplatex-brsg platex-brsg

uplatex-otf:
	for opt in default deluxe expert bold noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-v-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-v-uplatex.dvi ; \
	done

platex-otf:
	for opt in default deluxe expert bold noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-v-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-v-platex.dvi ; \
	done

uplatex-sp:
	for opt in default deluxe expert bold noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-v-uplatex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-v-uplatex.dvi ; \
	done

platex-sp:
	for opt in default deluxe expert bold noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-v-platex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-v-platex.dvi ; \
	done

uplatex-article:
	for opt in noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{article}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-a-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-a-uplatex.dvi ; \
	done

platex-article:
	for opt in noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{article}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-a-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-a-platex.dvi ; \
	done

uplatex-brsg:
	for opt in default expert; do \
	for burasage in br oi; do \
		$(UPLATEX) "\def\option{$$opt}\def\burasage{$$burasage}\def\class{ujbook}\input" upbrsgtest.tex ; \
		mv upbrsgtest.dvi upbrsgtest-$$opt-$$burasage-h-uplatex.dvi ; \
		$(DVIPDFMX) upbrsgtest-$$opt-$$burasage-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\burasage{$$burasage}\def\class{utbook}\input" upbrsgtest.tex ; \
		mv upbrsgtest.dvi upbrsgtest-$$opt-$$burasage-v-uplatex.dvi ; \
		$(DVIPDFMX) upbrsgtest-$$opt-$$burasage-v-uplatex.dvi ; \
	done \
	done

platex-brsg:
	for opt in default expert; do \
	for burasage in br oi; do \
		$(PLATEX) "\def\option{$$opt}\def\burasage{$$burasage}\def\class{jbook}\input" upbrsgtest.tex ; \
		mv upbrsgtest.dvi upbrsgtest-$$opt-$$burasage-h-platex.dvi ; \
		$(DVIPDFMX) upbrsgtest-$$opt-$$burasage-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\burasage{$$burasage}\def\class{tbook}\input" upbrsgtest.tex ; \
		mv upbrsgtest.dvi upbrsgtest-$$opt-$$burasage-v-platex.dvi ; \
		$(DVIPDFMX) upbrsgtest-$$opt-$$burasage-v-platex.dvi ; \
	done \
	done

clean:
	rm *.aux *.log *.dvi *.pdf
