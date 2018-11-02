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
        # xpub, mostly
        peterhooper: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDaQaYnpDAaSNkDfuompmMmthxiuqmV8RcDLrfEzQQ8sXrrwxIJyUmO0bhijePxLoOHMZdSz8NcAl2FGYIqWU4bpWpWIhFFUjGBSlN/KjYAhd1eUI+O24JOPPAi5+eInyHS5OJKmqg0MKq6LMbU3zHSFFZdKEfrkECv058X7qtkoMgU7KMtjy9OQZrrA5mWePuTKFrSWV+5Vxhna2L3odURO0ApzqyqsT9jyyTrOl2MFl4c0mFPzdJhZqqa4gjX/eikp8y4cM8C5j3rPvdrxArdTiN2PIuzPDOVYN/2nt8X8tmzTFVfM2/PxdlKINjppjimQH+L0CnpEwhA9IVMBoEF
        hem: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7gyp8ERD/f3amztI4qVx5oMOU6CrutIhjNrBvXwf98wBOlHvb2bIV72wAplFqrxu8MRrXnNfh0NGT9LkjxQ4E+VKPdDF77jgOPBtrOOwwpGSjzrf/oOHa0bi+ma2Y0bWNQ1WadNPpGdc1L8MMdiB3Hzw3zbLc9AY0biimlHxeWL8T+IhpBmJkT/LKXoMBurOZX/ZbWPzUGkmvqLZrMgqMpM8eOF5JjYmjkwfCKwmBr72AMq4npEOGpgJjO4OlozlbN4yh0BL5CnFDBQrFvMczUbH9JXq5ap1eljYsVaP/bfaV8RzM1OFzORIigrfGGueQsJtuNq+YoEdw6o24SzL7
        tamlyn: ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAmt3C4g/LHecU33xkMCeqzQf4f9VRjRcxCY/GDIl9jwHsJifaAFlfor9xt+i4zz9lCZc8jTcUOH5DikDc3lw0LL7R9cE9i6aedoSb+pWVTBOSSGJIBh6XBWMrnnYYqINIQJIAPGzUn6j9Lceks/2aBn7+U6H5TrwAcZIr8jnK2Is=

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
            elife-xpub:
                - alfred
                - tamlyn
                - hem
                - peterhooper

    docker:
        # username:
        # password:
        prune_days: 14
