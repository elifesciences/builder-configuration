elife:
    answer: 42

    ssh_credentials: {}
        # populate for single projects, `private_key` references must point
        # to files in builder-private
        #some_identifier:
        #    username: ubuntu
        #    home: /home/ubuntu
        #    private_key: salt://elife/ssh-credentials/sample.id_rsa

    ssh_users:
        # username: pubkey
        # admins
        luke: AAAAB3NzaC1yc2EAAAADAQABAAABAQDq5GhcACpdXr9t0Lo6K5tLnH1lnaPjuHsQ1kx/DShZl+9GoiqBqs77gyfxpUfzNmmMj0slsn/vxIEA4dZc+sZBFj1iq1P06CmuGghuQjmhqAY6/2RAAWKsdS7DuHzlgxoxncIAqhYE1L6uFCELZv8nrUyBJycIDbqtx8/7jt4zKfvX4cYlrY1lQFnqldW8V1i0am1U/kqfgcXstMthWWlrXzdIo15XtaWQZPJH0kFAUEbd6X4JB+nLBTWjzwZdnATa6l0KD8HtPxqCDh8VOPfbQYJCkAvMwznxTOZn8dRktWcPYygE4gagA/fGld+WlKspAt2HANBWCYpk/9lTPXAp
        luke_desktop: AAAAB3NzaC1yc2EAAAADAQABAAABAQDJgx7835mxeN+TLdMJ7u5kEs3iUtOma5OutE1ZOzeCixbVeRtb03QptP4Z4aHv7Mz7pgJ7RfgGx8ho0GJG1ojpRlHPm1HPRGsNKQdcoLNrB38i/8QKkGb3EqHTIqpV1bt7sxqwqokA53HF17UE9/87A3TahMRk7dEeGSfsafMBxnWUexod6m1Y+iz8y0MOWxxBIe/6x9L2zruxC6QTbJA49Dw3Xx01RXfX+6YmlLKv1NOMux50Gc/Ty+cgHpVLKiFOoifcD29B6l21ArQEUEUryr3KqwhNg1OBGXjVNlQyjgBeCvGF7aJpAvCRh4oqvJwcbN88VX/15FS6BCgXIpf3
        giorgio: AAAAB3NzaC1yc2EAAAADAQABAAABAQC5oh4s0zzScfAwLIXrIiEMMahhfYDb5/Kf4lawaSBEtigV3rg1CSmqN0LUuVvnBfUQN03t0jx6W/+68B+J9hBJAqnVPkVWxUpYHbK4tYW3jlSbRw7JCTDZhtBzLT4rxuhZn8yQY7ttuNecbjV4X8WTqv/6uEAZ8oSAvHWzPRj2/uBFdF1D4T+Dd9YlupLCDRH3BV6IAqGoGA5Ev0ESZ6jg6xXSsbqfs2RT/LSQq1S/fh4zHtql400P5A8YVo9sm14Aiz0ji7cuNr9oGksw3k0fxgh5J8kWNDn5gLlItmhcL5T6aSRaXDIwnpnJfQqmLohNyUJxU/rcuHZrLCj9Yo8T
        chris: AAAAB3NzaC1yc2EAAAADAQABAAACAQDCTjHMk8wDBM4CGiFgpmOMFkNG+ST2Sms61n2j/KK7ZZglcEp3AKBYHQnTpiP2LI64a2YcsCPFWkuHbY13DruubbYeUDnHuDMwPAzHU7DPBOTcCBVMjNOVE4oqjFKQftJQHucxD1RYDvsrIXZdT345k1fyyFYj0ho00SvgLWAUV0AhBq0IG7251yIrrC46+NOgd8U40HWD/z2eIpagglHKYSoTcqJlmvaSqPHyNep9N6R5xfEfqsxeVQp1i/+s7BBlHD0y8AWAtCRwPvTUqOLfkCag0WztonWOBSN/1PGS4TtNaFkfmlbcRivcwoTDKSNKUotDfKZCwg/iDDIJTZoEiTsIww1Z2na8DaVtUW9VyO3dVqh1wuquF/eagZzXZCctO9laaw604/jpLZvp82/4U9rSC8wcQ26fq7+ndQsTFIbQZ+h0yCvJxw1UlV1eQeTZMPLwTOri9TEWZ7XYtzaykQCXqAui3R2ERc8uib8ZJfygyZvo/1CSl2lcbOSlYYyi/yM7kDvy2eRSGTSHhWj//0UTADyl7DI0WrR3Oi3PYamONyR9hp9qGzIkRg2af7jkd7XLN2VhpVNUw/uZoDTAF0hPuCqXq14TdrzLOvE65K6J/gCAVNeQSrqIuvyTS2cPlZ/JWnlsFbY9uknzu2Ep7mAB43CXZyZXJRzm7jp1xw==
        # machine users
        alfred: AAAAB3NzaC1yc2EAAAADAQABAAABAQDPQG8kvfZjvw0MNz3PO7+MtuY/qRCDt/UZSJsJl5fm/ucSAgytpnowIGcgPDxfYf+4o5Ao6RXWrdjVfMzFGGXcgsnTu5er4KGYuQQ2/bHs5L/KaklXyyuGsDmCk1hsX5DqtHf8zmBaeTBCcIZZQ9+reNsLlcgk2zfmrTQxiTc+d96Ns3xaOqQOTD4WrypG2cTXHhBijOZBcaMAvjRxZKXDNWaddnxtnIoNQdqRovCZkxAgcqg3TqhyxyoPvKZZt/Hyhhe6EeGFfA+Rv0zSQZDOLVdI4AsSEPs3jd8e/UExlOYrjgHxo3/OpXeeCr3Msz6qXcuQkOfanGyTFOeGX7u1
        # data science
        daniel: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDWFJUAffNlNGh+NRr9pNRJ0QKBDgHxi/JNpgL856Er1SzPfaO3MshHOm4TC5l2orqgYjga9mzHL88oPSZN70xQA2OmNnhqHYVmNts26gyLuBxq69808o7eTELBf2oOCA0Ywh540wEEBnkmQ4FybohV5tRCFP7vuw3reqbMlshry6cjwawTCqYRZvWp8XCMrpKsJcHOLs/on7IPniUEB5yfcfsDCjFww1ToYA06B46pOOxeTq4fpcaL33VsVfWPxOypzxImSLyYpr+3gPOKNpCYJQspc4hLQ27dLUc447y1y0t950MOFZiu171ik1cZ0LVG1uC5ZxxqwEb0M/sNI5bScygvzUMYritgp0CjP0LO5UnbYTy6WfiL4uLq1P9RICaCkKC9SDK178nmlszfxIk6mYN7hEyquffAxxEl4BrSO2R12COtAJuwSVjNtKJV/W1J24ygfDOMgKplen0HaaYhlszDzaFsIQWaRj9+APNsi1QClYiI7NKioYNQAlt9haaNF0wD6g1wzE8DK4vS8P3pHzQfs+lHq2VQgCUKdjWQOL1SsaUmmHwSVuDgCsKFrS4ciOOrWXVBCosn1GvDaDVtbCEKuBO4P2V8giDsa5uzMxc2d1P2Lrbv665mSjDlPFBIjUYx5iuWXMchdEy7OQFSLr7BWUy0Vm9wKbosrQmzXQ==
        daniel_inspiron: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCWl11U9u+cF7+nKUt/dpc2ibYQ+0bIHXsgq9b3zCwiKsQ6diUDFm4E4hiXIXrxMmQjR5aZxL3Y9tpIJ6zMJp0mcOKM1vXAMZMF0aJvzm/gGUmB86Z/JHRARHCNsIYmwZpwMNSdt1WGLvC4yjvbTentATnABr5GDXzATWZdsbG9wX/T6vY563Z8lejX0HvE6gcqYgQ1CV9gOaHyHKPcuubgPTLrw6DIkK/MfYesifgJ719y9Hdp4gbNCDFQKiKOMrXeRvH6k7woHiffRKUSQcMUtSqV0mI6IFot7nheoY2k6bqxMEF1K+jxB1VyAazvuHiM5jlLVxTellzw3Y8UTuQAvE/I/n9py5AogVWfWBKwAWGUaZjKJMBEUqOAkgFgfQl3j5/nBNhnScgAGHCSBPPiB6doRCUa7qfN1anA76FeeN53JkZLUYjPWGKFuLX4FK+VPFC4tadoUDz27fDXuYhfbYRvea9y7nGOvgO0JbDR9o698BtdbaWo3s5xyzCHeOB68BheOGpV37lB4pGUZVrA6Dc9jRPR+EFcdkla802j8ABK1SZbh7i6LuIp+h8nYKU14mRW2qm5Y+nMYshx2YAfg9qMZWroXp5IojDtSjbxzVtDObTJCb9h86aWr0tbmeG6n95kHi62BqYhS0EAFzAWpTSyVgqCZbCkUsgSWZ5WJw==
        daniel_xps: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvWbLNw1CY9vykHXXNyvH6qcG1wuVh0Pm5EAJXrr6zSd2OLFo6XednxwjlB1Y3+xkgW78zo69l0wnWEzosfcDKNtwJYZuBGJvNx5z0JJR/FP/5g4iyJmCJ5rh8f6GWR2t4LwO4TE7uoD/PmjmN6lUKrbIss+OuLbJ1bROmaD46KfDrCyImX8/DhIwM9yAMB7JPEIcmwVq6qJMtXqYGjCxpyBaM6rcJdntSl/4v/rrTaREc74ah5UhDpXSz6CZ9UaBepOWjmtY1LcfCtEmIQj4wtOySILbqcaHxt65qmxcX1FuLs/0thxeHgwJ6d3melJ75CEAzAEQ2uwOXNkyBPrLFLLy/1urPUf2BKb604WZWpw/k1sJZneVHLguc0zKKTE6Fzr+EVb45Udcpu0a06knQyhbyfWzewgdxlLucadK1VVWOq+la2q4VOtDuCRMAnAjSxWUSA19QraKb1m4Lj5DvMqoZqEk8oX9oPiuL9ro0/zAbVkD7AEfoKNjN+46Oth6TMk8SysyFSL6Bwdjxf92fHkVdSvaMLODIs6bUZzRWOJJzyBZ/QQ4n4tZEx7D94Zu7d2FzQ0LFo1CaNUXNiM+Prl6RfD0+dEU9jMtk3gAvhoG9P99njmGVM8R1KzqSw6YY5UWR9N4y17tQzr8CwBFSwfGxgRTheUy5tIA7FEpEhw==
        # xpub, mostly
        peter: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDaQaYnpDAaSNkDfuompmMmthxiuqmV8RcDLrfEzQQ8sXrrwxIJyUmO0bhijePxLoOHMZdSz8NcAl2FGYIqWU4bpWpWIhFFUjGBSlN/KjYAhd1eUI+O24JOPPAi5+eInyHS5OJKmqg0MKq6LMbU3zHSFFZdKEfrkECv058X7qtkoMgU7KMtjy9OQZrrA5mWePuTKFrSWV+5Vxhna2L3odURO0ApzqyqsT9jyyTrOl2MFl4c0mFPzdJhZqqa4gjX/eikp8y4cM8C5j3rPvdrxArdTiN2PIuzPDOVYN/2nt8X8tmzTFVfM2/PxdlKINjppjimQH+L0CnpEwhA9IVMBoEF
        hem: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7gyp8ERD/f3amztI4qVx5oMOU6CrutIhjNrBvXwf98wBOlHvb2bIV72wAplFqrxu8MRrXnNfh0NGT9LkjxQ4E+VKPdDF77jgOPBtrOOwwpGSjzrf/oOHa0bi+ma2Y0bWNQ1WadNPpGdc1L8MMdiB3Hzw3zbLc9AY0biimlHxeWL8T+IhpBmJkT/LKXoMBurOZX/ZbWPzUGkmvqLZrMgqMpM8eOF5JjYmjkwfCKwmBr72AMq4npEOGpgJjO4OlozlbN4yh0BL5CnFDBQrFvMczUbH9JXq5ap1eljYsVaP/bfaV8RzM1OFzORIigrfGGueQsJtuNq+YoEdw6o24SzL7
        tamlyn: ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAmt3C4g/LHecU33xkMCeqzQf4f9VRjRcxCY/GDIl9jwHsJifaAFlfor9xt+i4zz9lCZc8jTcUOH5DikDc3lw0LL7R9cE9i6aedoSb+pWVTBOSSGJIBh6XBWMrnnYYqINIQJIAPGzUn6j9Lceks/2aBn7+U6H5TrwAcZIr8jnK2Is=
        javier: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRQUA+0RacnvwithdJBJx2EFIP0UH44yfF4E1tdT/+9ECMmA9sIrRqB7YlBo92eO6UXjvYLbrtzX4OJzEzTzxnqcdRGK/ktpdDv/NsB8CYiU/DoM5dv9NbjCpBbz0+iejUQv+bltOP2hZP6WiHbJ7Be1YVE0X2Zx9I9cQR8GZ7sEhRaxSwOds3vc/bRK2+UGIQZfL8MQqTXmjidigNorMbhUFjbL8w1rxLq8KDHL3kUhEJshIc6yKenIMTdPLixARsQYdWAWaCosrTSk4LG71pvqjiTLkmJkvwdiW2VgbJ8zqeUpOZCZt3kScn+F5Z8c+CfadrkYzTF76+TN3FladZ
        # tech
        giancarlo: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkdTrEimhkRzfny0yGYwC6pi1SATH1I6Dt/0OzoV0rnbS44ALXLGS1+9Z/WKKrZxtgVh5io1umgN9ILadyvFeZQby0XroIXMj43rSYKtaJXYthkf2wL0tmmvrKJnbo11XZRxQY65rN+WfQSvObx0oSuiwiKZUHPFZQpVk18rGb63AdfRgZc09wqlY9qEkmeVv+H2mi73AxTW6V7HfStPJqpKcE1BZyoG3o/flroDdeJXK8yUgJ3HpChlLeCdHPPOjUGahUV5nMOfCo/UDcBligcf6yIxtg8Y3QcXfmYgNnKrrwCVy+KgMjJ20+BpI0ron1OXUHyqUsVqlKFmsp2TTb
        david: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCqfGohXyqwJMD+3rQvoYo802OMTPQtit6mzhoZhCjDWNrg60G+wg79O1yF090K0M7laeaMKnQQ+cNB6v6fBJdT7Awpc9OO05BN4z/ThCu9d4WVP+k4159Qz7unVZ/cLceiCxZErdPh8QP5/tf7QDR+uH5YVvMndYYpKe3KLgIO+y+6YVRJheqKI2ZtETsZIHEfOEncKw7ac9iYrwgmIDS5EyFchc9I/ggnhsmwoNZiRHtoC1mYG3G+h/0ZmhtW/bLiDtYwWx6uZTDEymZzZPq3evg7PEK9umM5+1rRaV+4ojSF1YwmPeeU/qMw9Mr/Wrcg2RJTz5zq56aKi143qK6sGIwGAONTJYs6YnbfgUewkMb6c5HsqSxNNTV2YDDN5ttYkDDxFIBRkzdpbcS3+PzJQ1L4BcVFQlEPNlrgh4dY23OQ4nBF2awVZWZF+P09fcjAk0SDM1jG4bAytG5bnZKxvyxQ2R7355uSIIKFw/bn91DpdAv1XSPemM+hHZiQMq9BB/QXEC4NNPdAe7ZzeCj69l/yrcC1d2xX963rVm3rMPrzOCxJCv0JgKToS8fyNlpb4dxHQtO/V8N4fhgB681sP/GmLn+dwScxrxC6L6Mgh3ETvuz4IjHZtdvCEE3lUnWs1NXoj1ZvfslfNRFCRB7NEpQriDVC3tZplB4T+/Qew==

    # grants known users remote access to project systems
    ssh_access:
        # ssh access is granted to the vagrant/ubuntu (bootstrap user) as well as 
        # the deploy user (elife).
        also_bootstrap_user: True
        # adds keys to deploy user's `~/.ssh/authorized_keys` file
        allowed:
            # per-user access to all instances
            all:
                - luke
                - luke_desktop
                - giorgio
                - chris

            # per-user, per-project access
            containers:
                - alfred
                - daniel
                - daniel_inspiron
                - daniel_xps
                - nlisgo
                - peter
            crm:
                - graham_dev
                - graham_ubuntu_vm
                - alfred
                - michael
                - nlisgo # turning on instances for journal-cms testing
                # temporary, Daniel needs to run once-off SQL
                - daniel
                - daniel_inspiron
                - daniel_xps
                - circle_interactive
            elife-xpub:
                - alfred
                - tamlyn
                - hem
                - peter
                - daniel
                - daniel_inspiron
                - daniel_xps
                - javier
            peerscout:
                - daniel
                - daniel_inspiron
                - daniel_xps
                - alfred
            sciencebeam-texture:
                - daniel
                - daniel_inspiron
                - daniel_xps
                - alfred
            data-pipeline:
                - daniel
                - daniel_inspiron
                - daniel_xps
            profiles:
                - giancarlo
            bastion:
                - javier
                - peter
                - hem
                - david


    docker:
        # username:
        # password:
        prune_days: 14

    mockserver:
        expectations: {}
            #elife_bot: salt://elife-bot/config/mockserver.sh
