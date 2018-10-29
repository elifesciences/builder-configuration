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
        chris: AAAAB3NzaC1yc2EAAAADAQABAAACAQC4z8qiqGpf4UrqLWwalQNokQsRW4Ndz+6DmiHd2esDYVgKGM7MA1s3ruYhJjfdsqIr37RowdutmyGQkscmpVAEouvadw/1so6mDX6wRb8KP3RGSi2Bgmdoh7UZX41udl43hf4dm8esxpCfSbdd0ybk2lKKerdBWlDSuR2KkjLjSoUR8TPw8vLM13sA7Ig8VIe1lq6q7JXFL1Bg9+09Ozk+UxFivoa+bX+uJlLzgdXfqUgLpJa50n/8twlOWEwopKad8O660m3lf2SYi0ky3Y6ecTIMCxxLHxbk3zaUJm3n2dvtR+PbQI9G3RV/0cyiMoPFbZap7dVbBX84ITrNm1GqdhERPbLi7bduqa5wLkdX7dHh5e8THeulmujZLhQRQgyYGVIeRA98NNcOfSRifDdOFaAQcVEpDgxz1o3Ug91LNwu0DepDoP+RD/v+ViGKVUF6W+tL8PLxL1fe2wtTVt4ad0k+5CwKaQmBPmOr8dOsEiYFg4e2SfVYtjo2oNn00V/f6LHLv5fyl+VMBHcm6D84ITax237tUg8AZzeWEB9YzYxXAiRWpRX9oWKFMMxEH+CekiHbX8X93d4tBbdfev3UzMBlZjhRZ4+stSmFjpqv2Mis45USszIny7k3csKreNWFYtV1kflwtPY5BcCbsHWzk/AXWcs1r0G1mIN27BdiJw==
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
