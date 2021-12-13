from unittest import TestCase
from pytezos import ContractInterface

bob = "tz1iBobBobBobBobBobBobBobBobBodTWLCX"

class SimpleTest(TestCase):

    @classmethod
    def setUpClass(cls):
        cls.maxDiff = None

        code = open("./lambda.tz", 'r').read()
        cls.ct = ContractInterface.from_michelson(code)

    def test_simplest(self):
        res = self.ct.default(bob).interpret()

        print(res.storage)
