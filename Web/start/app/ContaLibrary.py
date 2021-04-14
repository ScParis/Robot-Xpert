
class ContaLibrary():
    def abrir_conta(self, saldo=0.00):
        self.saldo = 0.00
        self.deposita(saldo)

    def obter_saldo(self):
        return self.saldo

    def deposita(self, valor):
        self.saldo += valor

    def saca(self, valor):
        self.saldo -= valor
        self.saldo -= 2.00

# conta = ContaLibrary()
# conta.abrir_conta()
# conta.deposita(100.00)
# print(conta.obter_saldo())