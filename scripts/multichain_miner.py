#!/usr/bin/python3
from brownie import accounts, config, network, interface, Wei
import time, os

ACC_ID = "alpha"
ACTIVE_NETWORK = network.show_active()


def main():
    acc = get_account(ACC_ID)
    run(acc)


def run(acc):
    loop = True
    while loop:
        miner = interface.MaticMiner(
            config["networks"][network.show_active()]["miner_contract"]
        )
        last_hatch = get_last_hatch(miner, acc)
        if last_hatch > min_hatch_hours():
            sell_eggs(miner, acc)
        time.sleep(60 * 60)


def min_hatch_hours():
    if ACTIVE_NETWORK == "bsc-main":
        return 24
    return 8


def sell_eggs(miner, acc):
    print("About to sell eggs")
    tx = miner.sellEggs({"from": acc})
    return tx


def get_last_hatch(miner, acc):
    last_hatch = miner.lastHatch(acc.address)
    last_hatch_hours = (time.time() - last_hatch) / 3600
    print(f"Last hatched {last_hatch_hours} hours ago!")
    return last_hatch_hours


def get_account(_filename):
    account = accounts.load(_filename, os.environ["p1"])
    account_balance = account.balance() / 10 ** 18
    print("Account loaded")
    print("Balance:", account_balance)
    return account
